import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:async/async.dart';
import 'package:chunked_downloader/chunked_downloader.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;

import 'package:in_app_review/in_app_review.dart';
import 'package:music_download_youtube/app/core/utils/event_manager.dart';
import 'package:music_download_youtube/app/core/utils/event_manager_ext.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_playlist_model/res_playlist_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_url_video_model/res_url_video_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_version_model/res_version_model.dart';
import 'package:music_download_youtube/app/data/repository/music_repository.dart';
import 'package:music_download_youtube/app/utils/admob.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/widgets/add_like_playlist/add_like_playlist_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/create_playlist_widget/add_play_list_widget.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class HomeController extends FullLifeCycleController with FullLifeCycleMixin {
  TextEditingController downloadYoutube = TextEditingController();
  final InAppReview _inAppReview = InAppReview.instance;

  ScrollController scrollController = ScrollController();
  TextEditingController searchYoutube = TextEditingController();

  final playlist = <ResPlaylistModel>[].obs;
  final listMusicHome = <ResMusicDataModel>[].obs;
  final listMusicHomeSearch = <ResMusicDataModel>[].obs;
  final listMusicHomeNew = <ResMusicDataModel>[].obs;
  final musicGenre = <ResMusicDataModel>[].obs;

  late BannerAd? ad;
  final bannerReady = false.obs;
  final musicList = false.obs;

  Dio dio = Dio();

  final progrees = ''.obs;
  final progreesDouble = Rxn<double>();

  final _musicRepository = MusicRepository();
  final getUrlVideoEvent = InitializeEvent<ResUrlVideoModel>();
  final getVersionEvent = InitializeEvent<ResVersionModel>();

  final loadingBtn = false.obs;
  final clearSearchBtn = false.obs;
  String videoIdController = '';

  StreamSubscription? _intentDataStreamSubscription;

  ReceivePort _port = ReceivePort();

  CancelToken cancelToken = CancelToken();

  ChunkedDownloader? chunkedDownloader;

  @override
  void onInit() {
    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
      Future.delayed(const Duration(seconds: 1), () {
        downloadYoutube.text = value.validate();
      });
    }, onError: (err) {
      print("getLinkStream error: $err");
    });

    init();

    super.onInit();
  }

  @override
  void onDetached() {
    print("------------------------------------------------");

    print('HomeController - onDetached called');
  }

  // Mandatory
  @override
  void onInactive() {
    print("------------------------------------------------");

    print('HomeController - onInative called');
  }

  // Mandatory
  @override
  void onPaused() {
    print("------------------------------------------------");
    print('HomeController - onPaused called');
  }

  // Mandatory
  @override
  void onResumed() {
    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
      Future.delayed(const Duration(seconds: 1), () {
        downloadYoutube.text = value.validate();
      });
    }, onError: (err) {
      print("getLinkStream error: $err");
    });

    _getClipboardText();
  }

  Future<void> init() async {
    getPlaylist();
    getMusicList();
    observer();
    getVersionController();
  }

  void observer() {
    getUrlVideoEvent.result.listen((p0) {
      if (p0.status == Status.SUCCESS) {
        if (p0.data != null) {
          if (p0.data?.data != null) {
            var data = p0.data?.data;

            downloadFile(
                url: data!.url.validate(),
                idMusic: videoIdController,
                titleMusic: data.title.validate(),
                imageLagu: data.thumbnails.validate(),
                duration: data.duration.validate());
          }
        }
      } else if (p0.status == Status.LOADING) {
      } else if (p0.status == Status.ERROR) {
        loadingBtn.value = false;
        toast('Server error');
      }
    });
    getVersionEvent.result.listen((p0) async {
      if (p0.status == Status.SUCCESS) {
        if (p0.data != null) {
          if (p0.data!.data != null) {
            getVersion(p0.data!.data!.nameVersion.validate());
          }
        }
      } else if (p0.status == Status.LOADING) {
      } else if (p0.status == Status.ERROR) {
        loadingBtn.value = false;
      }
    });
  }

  Future<void> getVersion(String version) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionInfo = packageInfo.version;

    if (version.isNotEmpty) {
      if (version != versionInfo) {
        showDialogBox(
          Get.context,
          "Update app version",
          "Please update app to version $version",
          onCall: () {
            openStoreListing();
          },
        );
      }
    }
  }

  Future<void> openStoreListing() => _inAppReview.openStoreListing(
        appStoreId: appStoreId,
        microsoftStoreId: microsoftStoreId,
      );

  void getMusicList() {
    listMusicHome.clear();
    listMusicHomeNew.clear();
    listMusicHome.value = getMusicListFromSharePref();
    listMusicHomeSearch.value = listMusicHome;
    List<ResMusicDataModel> abc = listMusicHome.reversed.map((e) => e).toList();

    if (abc.length > 10) {
      listMusicHomeNew.value = abc.getRange(0, 10).map((e) => e).toList();
    } else {
      listMusicHomeNew.value = abc;
    }
  }

  void searchMusic(String v) {
    listMusicHomeSearch.value = listMusicHome
        .where((p0) =>
            p0.judulLagu.validate().toLowerCase().contains(v.toLowerCase()))
        .toList();
    if (v.isNotEmpty) {
      clearSearchBtn.value = true;
    } else {
      clearSearchBtn.value = false;
    }
  }

  void getPlaylist() {
    // String? getPlayListString = getStringAsync(playlistSharePref);
    playlist.clear();
    playlist.value = getPlayListFromSharePref();
    // if (!getPlayListString.isEmptyOrNull) {
    //   playlist.value = (jsonDecode(getPlayListString) as List<dynamic>)
    //       .map<ResPlaylistModel>((e) => ResPlaylistModel.fromJson(e))
    //       .toList();
    // }
  }

  void addPlaylist(BuildContext context) {
    Get.bottomSheet(
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            const AddPlayListWidget())
        .whenComplete(() => getPlaylist());
  }

  void tabToMore(BuildContext context, ResMusicDataModel detailMusic) {
    Get.bottomSheet(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        enableDrag: true,
        isScrollControlled: true,
        AddLikePlaylistWidget(
          detailMusic: detailMusic,
        ));
  }

  void genreDetail(String idGenre) {
    musicGenre.value =
        listMusicHome.where((element) => element.idGenre == idGenre).toList();
  }

  void initAds() {
    ad = BannerAd(
      adUnitId: getBannerAdUnitId()!,
      size: AdSize.largeBanner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: ((add) {
          bannerReady.value = true;
          // ad = add as BannerAd;
        }),
        onAdFailedToLoad: (ad, error) {
          bannerReady.value = false;
          ad.dispose();
        },
      ),
    );
    ad?.load();
  }

  void _getClipboardText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null) {
      if (clipboardData.text.validate().isNotEmpty) {
        Future.delayed(const Duration(seconds: 1), () {
          String? clipboardText = clipboardData.text;
          downloadYoutube.text = clipboardText.validate();
          Clipboard.setData(const ClipboardData(text: ''));
        });
      }
    }
  }

  void getVideoUrlController(String videoId) {
    loadingBtn.value = true;
    videoIdController = videoId;
    _musicRepository
        .getUrlVideoRepository(videoId)
        .addEvent(event: getUrlVideoEvent);
  }

  void getVersionController() {
    _musicRepository.getVersionRepository().addEvent(event: getVersionEvent);
  }

  void downloadFile({
    required String url,
    required String idMusic,
    required String titleMusic,
    required String imageLagu,
    required String duration,
  }) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$idMusic.mp3');
    bool fileExists = await file.exists();

    if (fileExists) {
      toast("File already exists");
      loadingBtn.value = false;
    } else {
      print("-------------Masuk download---------------");
      String? link;
      try {
        link = await FlutterYoutubeDownloader.extractYoutubeLink(
            url.validate(), 140);
      } on PlatformException {
        link = 'Failed to Extract YouTube Video Link.';
      }

      // try {
      //   int offset = 0;
      //   var httpClient = http.Client();
      //   String url =
      //       "https://rr8---sn-2uuxa3vh-wvbz.googlevideo.com/videoplayback?expire=1683274898&ei=MmhUZPcL5cHi3g_qn5bwDA&ip=36.73.102.185&id=o-AK1nycIsWSm0KpT9yqMmS5KyPtYb-ObSr24y400TFNxT&itag=251&source=youtube&requiressl=yes&mh=mL&mm=31%2C29&mn=sn-2uuxa3vh-wvbz%2Csn-npoe7ns6&ms=au%2Crdu&mv=m&mvi=8&pl=20&initcwndbps=633750&vprv=1&svpuc=1&mime=audio%2Fwebm&gir=yes&clen=787272545&dur=47295.841&lmt=1682700588923209&mt=1683252791&fvip=2&keepalive=yes&fexp=24007246&c=ANDROID&txp=4532434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRgIhAN32KFRAhagX4CHXB5_N6VpSKckuuc1tE6c1DoQLOYXyAiEAhV0z5A2vtmf9grY5RAi6-Fvr_5QafAcmg6flUgOiozw%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhAPDOd4rztOtGFcrO3ZTSeEDAb34dhm-n2hNaogv2MlL9AiBIisetV3K3kruU70ozNZXUlq29OZ4svEIvgQE3UttQqw%3D%3D";
      //   var request = http.Request('GET', Uri.parse(
      //       // link.validate()
      //       // "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      //       // "http://47.251.37.12/music_asset/music-2Ma92WwbOoVgeiYVY52VcBaiDap-7-Relaxing Background Guitar Music - meditate, focus, study, think.mp3"
      //       url));
      //   var response = httpClient.send(request);

      //   // Open file
      //   File fileTmp = File('$dir/$idMusic.tmp');

      //   response.asStream().listen((http.StreamedResponse r) async {
      //     final reader = ChunkedStreamReader(r.stream);
      //     try {
      //       // Set buffer size to 64KB
      //       int chunkSize = 1024 * 1024;
      //       Uint8List buffer;
      //       do {
      //         buffer = await reader.readBytes(chunkSize);
      //         // Add buffer to chunks list
      //         offset += buffer.length;
      //         print('Downloading  ${offset ~/ 1024 ~/ 1024}MB');
      //         // Write buffer to disk
      //         await fileTmp.writeAsBytes(buffer, mode: FileMode.append);
      //       } while (buffer.length == chunkSize);

      //       // Rename file from .tmp to non-tmp extension
      //       await fileTmp.rename(file.path);
      //     } catch (e) {
      //       print(e);
      //     } finally {
      //       reader.cancel();
      //       toast("Download Complate Finish1");
      //     }
      //   }).onDone(() async {
      //     toast("Download Complate Finish2");
      //     // do something when finished
      //   });
      // } catch (error) {
      //   print('Error downloading: $error');
      // }

      // try {
      //   List<List<int>> chunks = [];
      //   int downloaded = 0;

      //   var httpClient = http.Client();
      //   var request = http.Request('GET', Uri.parse(link.validate()));
      //   var response = httpClient.send(request);
      //   loadingBtn.value = false;
      //   response.asStream().listen((http.StreamedResponse r) async {
      //     final reader = ChunkedStreamReader(r.stream);
      //     try {
      //       int chunkSize = 64 * 1024;
      //       Uint8List buffer;
      //       do {
      //         buffer = await reader.readBytes(chunkSize);
      //         chunks.add(buffer);
      //         downloaded += buffer.length;
      //         print('Downloading Hore ${downloaded ~/ 1024 ~/ 1024}MB');
      //       } while (buffer.length == chunkSize);
      //       // File file = File(downloadPath);
      //       final Uint8List bytes = Uint8List(r.contentLength!);
      //       int offset = 0;
      //       for (List<int> chunk in chunks) {
      //         bytes.setRange(offset, offset + chunk.length, chunk);
      //         offset += chunk.length;
      //       }
      //       await file.writeAsBytes(bytes);
      //     } catch (e) {
      //       print(e);
      //     } finally {
      //       reader.cancel();
      //       toast("Download Complate1");
      //       downloadYoutube.clear();
      //       setCache(
      //           idMusic: idMusic.validate(),
      //           urlPath: file.path,
      //           judulLagu: titleMusic.validate(),
      //           imageLagu: imageLagu.validate(),
      //           duration: duration.validate());
      //       progreesDouble.value = null;
      //     }
      //   }).onDone(() {
      //     toast("Download Complate 2");
      //     loadingBtn.value = false;
      //   });
      // } catch (e) {
      //   downloadYoutube.clear();
      //   loadingBtn.value = false;
      //   toast(
      //       "Downlod error, please select another url, because some privacy from youtube");
      //   progreesDouble.value = null;
      // }

      try {
        chunkedDownloader = await ChunkedDownloader(
            // url:
            //     "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
            url:
                "https://rr1---sn-2uuxa3vh-wvbl.googlevideo.com/videoplayback?expire=1683318069&ei=1RBVZLLkNYW99QPWoLWQDw&ip=36.73.102.185&id=o-AJD0Nw8CLhzhPtRogkSYUr2QiOQNy6HJgzyR_6j-hL9A&itag=18&source=youtube&requiressl=yes&mh=Be&mm=31%2C29&mn=sn-2uuxa3vh-wvbl%2Csn-npoeenek&ms=au%2Crdu&mv=m&mvi=1&pl=20&initcwndbps=537500&vprv=1&svpuc=1&mime=video%2Fmp4&gir=yes&clen=180021276&ratebypass=yes&dur=3410.198&lmt=1683134373793007&mt=1683296007&fvip=4&fexp=24007246&c=ANDROID&txp=4438434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgMzZN7zxo5VR3IJnH16AGByg3Y6tnFgyExKVD7njlCskCIDasMZLb7Cvkb82sBDejNO1c89n3hhnmzWUBG51n84-j&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRgIhAJtLTYzaSmkp9eEgClayleuUQTubAoZRQvxnyWrWb0CfAiEAyDQUwvgM7ZSezKJFzZzsnQqUHOPIEAngj6aBv214M5A%3D",
            // url: link.validate(),
            saveFilePath: file.path,
            chunkSize: 1024 * 1024,
            onError: (error) {
              downloadYoutube.clear();
              loadingBtn.value = false;
              toast(
                  "Downlod error, please select another url, because some privacy from youtube");
              progreesDouble.value = null;
            },
            onProgress: (received, total, speed) {
              print("Received: $received, Total: $total, Speed: $speed");
              loadingBtn.value = false;
              if (total != -1) {
                progreesDouble.value = (received / total * 1);
              } else {
                progreesDouble.value = null;
              }
            },
            onDone: (file2) {
              print(file2.path);
              downloadYoutube.clear();
              setCache(
                  idMusic: idMusic.validate(),
                  urlPath: file.path,
                  judulLagu: titleMusic.validate(),
                  imageLagu: imageLagu.validate(),
                  duration: duration.validate());
              toast("Download Complate");
              progreesDouble.value = null;
            }).start();
        loadingBtn.value = false;
      } catch (e) {
        downloadYoutube.clear();
        loadingBtn.value = false;
        toast(
            "Downlod error, please select another url, because some privacy from youtube");
        progreesDouble.value = null;
      }

      // try {
      //   String url2 =
      //       "https://rr1---sn-2uuxa3vh-wvbz.googlevideo.com/videoplayback?expire=1683312159&ei=v_lUZPHzFOux3LUPq9SloAo&ip=36.73.102.185&id=o-AAoOAa8drrlT-cgoGKOXFYTR0fA3IpC0iXkElWARl3ub&itag=140&source=youtube&requiressl=yes&mh=nD&mm=31%2C29&mn=sn-2uuxa3vh-wvbz%2Csn-npoe7ndl&ms=au%2Crdu&mv=m&mvi=1&pl=20&initcwndbps=626250&vprv=1&svpuc=1&mime=audio%2Fmp4&gir=yes&clen=50851209&dur=3142.031&lmt=1682495540687277&mt=1683290243&fvip=1&keepalive=yes&fexp=24007246&c=ANDROID&txp=5532434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRAIgXTuCAqrpjSFNvQcdKnFFb-ORYJzCa2lFO5KOBqHME74CIHBMY5Tq9bv0GtNLUdpCZQn5jfORViM85YYNX_JuTzLg&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhANa20LaWq5M01QDTdY_fdyL8VyLbwHO_qdM_QLITF9yNAiAxK0R-46giVG-kmzox3DSF2pisy0mDizdh9s0k618_vQ%3D%3D";

      //   await dio.downloadUri(
      //     Uri.parse(
      //         // link.validate()
      //         url2),
      //     file.path,
      //     options: Options(
      //         responseType: ResponseType.stream,
      //         followRedirects: true,
      //         validateStatus: (status) {
      //           return status! < 500;
      //         }),
      //     onReceiveProgress: (received, total) {
      //       loadingBtn.value = false;
      //       if (total != -1) {
      //         progreesDouble.value = (received / total * 1);
      //       } else {
      //         progreesDouble.value = null;
      //       }
      //     },
      //   ).then((value) {
      //     downloadYoutube.clear();
      //     setCache(
      //         idMusic: idMusic.validate(),
      //         urlPath: file.path,
      //         judulLagu: titleMusic.validate(),
      //         imageLagu: imageLagu.validate(),
      //         duration: duration.validate());
      //     toast("Download Complete");
      //     progreesDouble.value = null;
      //   });
      //   loadingBtn.value = false;
      // } catch (e) {
      //   downloadYoutube.clear();
      //   loadingBtn.value = false;
      //   toast("Download error");
      //   progreesDouble.value = null;
      // }
    }
  }

  setCache({
    required String idMusic,
    required String urlPath,
    required String judulLagu,
    required String imageLagu,
    required String duration,
  }) async {
    var listMusic = getMusicListFromSharePref();
    // int indexMusic = listMusic.indexWhere(((e) => e.id == idMusic));
    List<ResMusicDataModel> newlistMusic = listMusic;

    var abc = ResMusicDataModel(
        id: idMusic,
        localLagu: urlPath,
        judulLagu: judulLagu,
        imageLagu: imageLagu,
        duration: duration);
    newlistMusic.add(abc);

    setValue(musicListLocal, jsonEncode(newlistMusic));
    getMusicList();
    // adShowrewardedAd();
  }

  @override
  void onClose() {
    ad?.dispose();
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.onClose();
  }
}
