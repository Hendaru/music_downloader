import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:music_download_youtube/app/core/utils/event_manager.dart';
import 'package:music_download_youtube/app/core/utils/event_manager_ext.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_playlist_model/res_playlist_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_url_video_model/res_url_video_model.dart';
import 'package:music_download_youtube/app/data/repository/music_repository.dart';
import 'package:music_download_youtube/app/utils/admob.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/widgets/add_like_playlist/add_like_playlist_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/create_playlist_widget/add_play_list_widget.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class HomeController extends FullLifeCycleController with FullLifeCycleMixin {
  TextEditingController downloadYoutube = TextEditingController();

  final playlist = <ResPlaylistModel>[].obs;
  final listMusicHome = <ResMusicDataModel>[].obs;
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

  final loadingBtn = false.obs;
  String videoIdController = '';

  StreamSubscription? _intentDataStreamSubscription;

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

    // // For sharing or opening urls/text coming from outside the app while the app is closed
    // ReceiveSharingIntent.getInitialText().then((value) {
    //   print("-------------------------Hore joss---------------------------");
    //   print(value);
    // });
    _getClipboardText();
  }

  void init() {
    getPlaylist();
    getMusicList();
    observer();
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
  }

  getMusicList() {
    listMusicHome.clear();
    listMusicHomeNew.clear();
    listMusicHome.value = getMusicListFromSharePref();
    // listMusicHome.shuffle();
    List<ResMusicDataModel> abc = listMusicHome.reversed.map((e) => e).toList();

    if (abc.length > 10) {
      listMusicHomeNew.value = abc.getRange(0, 10).map((e) => e).toList();
    } else {
      listMusicHomeNew.value = abc;
    }
  }

  void getPlaylist() {
    String? getPlayListString = getStringAsync(playlistSharePref);
    playlist.clear();
    if (!getPlayListString.isEmptyOrNull) {
      playlist.value = (jsonDecode(getPlayListString) as List<dynamic>)
          .map<ResPlaylistModel>((e) => ResPlaylistModel.fromJson(e))
          .toList();
    }
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

    // DownloadProgressModel downloadProgress =
    //     DownloadProgressModel(completeDownload: false, progresDownload: 0.0);

    if (fileExists) {
      toast("File already exists");
      loadingBtn.value = false;
    } else {
      try {
        await dio.download(
          url.validate(),
          file.path,
          onReceiveProgress: (received, total) {
            loadingBtn.value = false;
            if (total != -1) {
              progrees.value = (received / total * 100).toStringAsFixed(0);

              progreesDouble.value = (received / total * 1);
            } else {
              progreesDouble.value = null;
            }
          },
        ).then((value) {
          downloadYoutube.clear();
          setCache(
              idMusic: idMusic.validate(),
              urlPath: file.path,
              judulLagu: titleMusic.validate(),
              imageLagu: imageLagu.validate(),
              duration: duration.validate());
          toast("Download Complate");
          progreesDouble.value = null;
        });
        loadingBtn.value = false;
      } catch (e) {
        downloadYoutube.clear();
        loadingBtn.value = false;
        toast(
            "Downlod error, please select another url, because some privacy from youtube");
        progreesDouble.value = null;
      }
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
    adShowrewardedAd();
  }

  @override
  void onClose() {
    ad?.dispose();
    super.onClose();
  }
}
