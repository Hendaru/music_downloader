import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:music_download_youtube/app/data/models/models_commons/progress_bar_model/progress_bar_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_downloaded_model/res_downloaded_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_playlist_model/res_playlist_model.dart';
import 'package:music_download_youtube/app/modules/downloaded/views/downloaded_view.dart';
import 'package:music_download_youtube/app/modules/home/controllers/home_controller.dart';
import 'package:music_download_youtube/app/modules/home/views/home_view.dart';
import 'package:music_download_youtube/app/modules/like/views/like_view.dart';
import 'package:music_download_youtube/app/modules/playList/views/play_list_view.dart';
import 'package:music_download_youtube/app/modules/settings/views/settings_view.dart';
import 'package:music_download_youtube/app/modules/trending/views/trending_view.dart';
import 'package:music_download_youtube/app/notifiers/play_button_notifier.dart';
import 'package:music_download_youtube/app/notifiers/repeat_button_notifier.dart';

import 'package:music_download_youtube/app/utils/admob.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/widgets/create_playlist_widget/add_play_list_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/item_playlist_widget.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sizer/sizer.dart';

class DasboardController extends GetxController with WidgetsBindingObserver {
  final widgets = <Widget>[].obs;
  final currentIndex = 0.obs;
  Curve curve = Curves.linearToEaseOut;
  final AudioPlayer audioPlayer = AudioPlayer();

//player

  final playlistLocal = <ResPlaylistModel>[].obs;
  final listMusic = <ResMusicDataModel>[].obs;
  final curentMusic = Rxn<ResMusicDataModel>();
  final curentMusicIdLike = false.obs;

  final progressNotifier = ProgressBarModel().obs;
  final playButtonNotifier = ButtonState.paused.obs;
  final repeatButtonNotifier = RepeatButtonNotifier();

  final currentSongTitleNotifier = ''.obs;
  final currentSongIdNotifier = ''.obs;
  final currentSongDurationNotifier = ''.obs;
  final currentSongImageNotifier = ''.obs;
  final currentSongArtistNotifier = ''.obs;
  final playlistNotifier = <String>[].obs;
  final isShuffleModeEnabledNotifier = false.obs;
  final isFirstSongNotifier = true.obs;
  final isLastSongNotifier = true.obs;
  late ConcatenatingAudioSource playlist;
  late LockCachingAudioSource playCache;

  Dio dio = Dio();
  final progreesDouble = Rxn<double>();
  final progreesVideo = ''.obs;
  final progreesAudio = ''.obs;
  final loadingBtnVideo = false.obs;

  StatusToPlay? statusPlayNow;
  final idCurentDownload = "".obs;
  BannerAd? ad;
  final imageDelay = false.obs;
  final adsDelay = false.obs;

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // Timer? timer;
  // final start = 3.obs;
  // final progressAds = 0.obs;

  @override
  void onInit() {
    super.onInit();
    init();
    initFuncPlayer();
    internetConnection();
    WidgetsBinding.instance.addObserver(this);
  }

  init() {
    widgets.add(const TrendingView());
    widgets.add(const LikeView());
    widgets.add(const DownloadedView());
    widgets.add(const SettingsView());
  }

  void internetConnection() {
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((e) {
      if (e == ConnectivityResult.none) {
        toast('No internet connection.');
      } else {
        toast('Internet is connected.');
      }
    });
  }

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  //player func
  void initFuncPlayer() {
    listenForChangesInPlayerState();
    listenForChangesInPlayerPosition();
    listenForChangesInBufferedPosition();
    listenForChangesInTotalDuration();
    listenForChangesInSequenceState();
  }

  void delayImage() {
    Future.delayed(const Duration(seconds: 7), () {
      openAdShow();
    });
  }

  Widget showBannerAdsDasboard({required AdSize adSize}) {
    return Center(
      child: SizedBox(
        height: adSize.height.toDouble(),
        width: adSize.width.toDouble(),
        child: AdWidget(
          ad: BannerAd(
            adUnitId: getBannerAdUnitId()!,
            size: adSize,
            request: const AdRequest(),
            listener: BannerAdListener(
              onAdLoaded: ((ads) {
                ad = ads as BannerAd;
                toast(ads.toString());
              }),
              onAdClosed: (adsh) {},
              onAdFailedToLoad: (ad, error) {
                ad.dispose();
              },
            ),
          )..load(),
        ),
      ),
    );
  }

  void deleteItemMusic(ResMusicDataModel musicItem) {
    var listMusicFromSharePref = getMusicListFromSharePref();
    int indexMusic = listMusic.indexWhere(((e) => e.id == musicItem.id));

    List<ResMusicDataModel> newlistMusic = listMusicFromSharePref;
    newlistMusic[indexMusic] =
        newlistMusic[indexMusic].copyWith(idPlayList: "");

    setValue(musicListLocal, jsonEncode(newlistMusic)).whenComplete(() {
      listMusic.removeWhere((element) => element.id == musicItem.id);
      playlist.removeAt(indexMusic).whenComplete(() async {
        // setPlayList(listMusic);
        await audioPlayer.setAudioSource(playlist,
            initialIndex: audioPlayer.currentIndex != indexMusic
                ? audioPlayer.currentIndex
                : null,
            initialPosition: audioPlayer.currentIndex != indexMusic
                ? progressNotifier.value.current
                : Duration.zero);
      });

      Get.back();
    });
  }

  setPlayList(List<ResMusicDataModel> listSound) {
    playlist = ConcatenatingAudioSource(
        children: listSound.map((e) {
      Map<String, dynamic> dataExtras = <String, dynamic>{};

      for (String type in e.toJson().keys) {
        dataExtras[type.toString()] = e.toJson()[type];
      }
      var mediaItemTag = MediaItem(
          id: e.id.validate(),
          // id: e.localLagu.isEmptyOrNull
          //     ? e.localLagu.validate()
          //     : e.id.validate(),
          album: e.idArtist,
          title: e.judulLagu.validate(),
          artist: 'Hore',
          extras: dataExtras,
          artUri: Uri.parse(e.imageLagu.validate()));

      return AudioSource.uri(Uri.file(e.localLagu!), tag: mediaItemTag);
      // return AudioSource.uri(Uri.parse(e.assetLagu!), tag: mediaItemTag);
    }).toList());
  }

  void initPlaylist(
      {
      //  List<ResMusicDataModel>? listSound,
      String? id,
      StatusToPlay? statusPlay}) async {
    var listMusicNew = getMusicListFromSharePref().reversed;
    var idPlay = getStringAsync(idPlayNow);
    // var statusFromPlay = getStringAsync(idPlayNow);

    if (id != null) {
      if (id.contains("playlist")) {
        listMusic.value =
            listMusicNew.where((e) => e.idPlayList == id).toList();
      } else {
        listMusic.value = listMusicNew.where((e) => e.id == id).toList();
      }
    } else {
      if (!idPlay.isEmptyOrNull) {
        if (idPlay.contains("playlist")) {
          listMusic.value =
              listMusicNew.where((e) => e.idPlayList == idPlay).toList();
        } else {
          listMusic.value = listMusicNew.where((e) => e.id == id).toList();
          // if (idPlay.contains("music")) {
          //   listMusic.value = listMusic.value =
          //       listMusicNew.where((e) => e.id == id).toList();
          // } else {
          //   listMusic.value = [];
          // }
        }
      } else {
        listMusic.value = [];
        // if (listSound != null) {
        //   listMusic.value = listSound;
        // }
      }
    }

    if (id != null) {
      setValue(idPlayNow, id.validate());

      statusPlayNow = statusPlay;
    }

    setPlayList(listMusic);

    try {
      // ignore: unrelated_type_equality_checks
      if (playButtonNotifier == ButtonState.loading) {
        toast("Please wait...");
      } else {
        if (id != null) {
          if (idPlay != id) {
            await audioPlayer
                .setAudioSource(
                  playlist,
                )
                .whenComplete(() => audioPlayer.play());
          } else {
            await audioPlayer
                .setAudioSource(playlist,
                    initialIndex: audioPlayer.currentIndex,
                    initialPosition: progressNotifier.value.current)
                .whenComplete(() => audioPlayer.play());
          }
        } else {
          // if (listSound != null) {
          //   await audioPlayer
          //       .setAudioSource(
          //         playlist,
          //       )
          //       .whenComplete(() => audioPlayer.play());
          // }
        }
      }
    } on PlayerException catch (e) {
      // iOS/macOS: maps to NSError.code
      // Android: maps to ExoPlayerException.type
      // Web: maps to MediaError.code
      print("Error code: ${e.code}");
      // iOS/macOS: maps to NSError.localizedDescription
      // Android: maps to ExoPlaybackException.getMessage()
      // Web: a generic message
      print("Error message: ${e.message}");
    } on PlayerInterruptedException catch (e) {
      // This call was interrupted since another audio source was loaded or the
      // player was stopped or disposed before this audio source could complete
      // loading.
      print("Connection aborted: ${e.message}");
    } catch (e) {
      // Fallback for all errors
      print(e);
    }
  }

  void setAudioNow(String idA, String idB) {}

  void listenForChangesInPlayerState() {
    audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        audioPlayer.seek(Duration.zero);
        audioPlayer.pause();
      }
    });
  }

  void listenForChangesInPlayerPosition() {
    audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarModel(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void listenForChangesInBufferedPosition() {
    audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarModel(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void listenForChangesInTotalDuration() {
    audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarModel(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void updateLike() {
    var listMusic = getMusicListFromSharePref();
    ResMusicDataModel item = listMusic
        .firstWhere(((e) => e.id == currentSongIdNotifier.value.validate()));

    if (item.idLike == "1") {
      curentMusicIdLike.value = true;
    } else {
      curentMusicIdLike.value = false;
    }
  }

  void addPlaylist(BuildContext context) {
    Get.bottomSheet(
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            const AddPlayListWidget())
        .whenComplete(() => openBottomSheetDasboardPlayList(context));
  }

  void setMusicToPlaylist(ResPlaylistModel itemList) {
    if (currentSongIdNotifier.isNotEmpty) {
      playlistLocal.value = getPlayListFromSharePref();
      var listMusic = getMusicListFromSharePref();
      int indexMusic =
          listMusic.indexWhere(((e) => e.id == currentSongIdNotifier.value));

      List<ResMusicDataModel> newlistMusic = listMusic;
      newlistMusic[indexMusic] =
          newlistMusic[indexMusic].copyWith(idPlayList: itemList.idPlayList);
      setValue(musicListLocal, jsonEncode(newlistMusic));

      int index =
          playlistLocal.indexWhere((e) => e.idPlayList == itemList.idPlayList);
      playlistLocal[index] = playlistLocal[index]
          .copyWith(image: currentSongImageNotifier.value.validate());

      setValue(playlistSharePref, jsonEncode(playlistLocal));

      Future.delayed(const Duration(seconds: 1), () {
        Get.back();
        toast("Added to playlist");
      });
    }
  }

  void openBottomSheetDasboardPlayList(BuildContext context) {
    Get.bottomSheet(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      isScrollControlled: true,
      SizedBox(
        height: 90.h,
        child: Column(
          children: [
            1.h.height,
            SizedBox(
                width: 20.w,
                child: const Divider(
                  thickness: 4.0,
                )),
            3.h.height,
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: getPlayListFromSharePref()
                    .map((element) => ItemPlayListWidget(
                          itemPlayList: element,
                          functionItem: (e) => setMusicToPlaylist(e),
                        ))
                    .toList(),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
      ),
    ).whenComplete(() {
      Future.delayed(const Duration(seconds: 1), () {
        HomeController controllerHome = Get.put(HomeController());
        controllerHome.getPlaylist();
      });
    });
  }

  void listenForChangesInSequenceState() {
    audioPlayer.sequenceStateStream.listen((sequenceState) {
      if (sequenceState == null) return;
      // // update current song title
      final currentItem = sequenceState.currentSource;

      ResMusicDataModel tagData =
          ResMusicDataModel.fromJson(currentItem?.tag.extras);

      currentSongTitleNotifier.value = tagData.judulLagu.validate();
      currentSongArtistNotifier.value = tagData.idArtist.validate();
      currentSongDurationNotifier.value = tagData.duration.validate();
      currentSongImageNotifier.value =
          //tagData.imageLagu.validate();
          tagData.imageLagu.validate();
      currentSongIdNotifier.value = tagData.id.validate();
      updateLike();

      // print("--------------tagData------------------");
      // print(tagData.imageLagu.validate());

      // // update playlist
      final playlist = sequenceState.effectiveSequence;
      List<String> titles = playlist.map((item) {
        ResMusicDataModel tagData = ResMusicDataModel.fromJson(item.tag.extras);
        return tagData.judulLagu.validate();
      }).toList();

      // List<ResMusicDataModel> listAbc = playlist.map((item) {
      //   ResMusicDataModel tagData = ResMusicDataModel.fromJson(item.tag.extras);
      //   return tagData;
      // }).toList();

      // listMusicNow.value = listAbc;

      playlistNotifier.value = titles;

      // update shuffle mode
      isShuffleModeEnabledNotifier.value = sequenceState.shuffleModeEnabled;

      // update previous and next buttons
      if (playlist.isEmpty || currentItem == null) {
        isFirstSongNotifier.value = true;
        isLastSongNotifier.value = true;
      } else {
        isFirstSongNotifier.value = playlist.first == currentItem;
        isLastSongNotifier.value = playlist.last == currentItem;
      }
    }).onDone(() {});
  }

  void play() async {
    audioPlayer.play();
  }

  void pause() {
    audioPlayer.pause();
  }

  void seek(Duration position) {
    audioPlayer.seek(position);
  }

  void onRepeatButtonPressed() {
    repeatButtonNotifier.nextState();
    switch (repeatButtonNotifier.value) {
      case RepeatState.off:
        audioPlayer.setLoopMode(LoopMode.off);
        break;
      case RepeatState.repeatSong:
        audioPlayer.setLoopMode(LoopMode.one);
        break;
      case RepeatState.repeatPlaylist:
        audioPlayer.setLoopMode(LoopMode.all);
    }
  }

  void onPreviousSongButtonPressed() {
    audioPlayer.seekToPrevious();
  }

  void onNextSongButtonPressed() {
    audioPlayer.seekToNext();
  }

  void onShuffleButtonPressed() async {
    final enable = !audioPlayer.shuffleModeEnabled;
    if (enable) {
      await audioPlayer.shuffle();
    }
    await audioPlayer.setShuffleModeEnabled(enable);
  }

  void setLikeMusicDasboard() {
    if (currentSongIdNotifier.isNotEmpty) {
      // List<ResMusicModel> lisLiketMusic =
      //     like.map((e) => e.copyWith()).toList();
      // lisLiketMusic.add(detailMusic!);
      // like.value = lisLiketMusic;
      // setValue(likeSharePref, jsonEncode(like));

      var listMusic = getMusicListFromSharePref();
      // ignore: unrelated_type_equality_checks
      int indexMusic =
          listMusic.indexWhere(((e) => e.id == currentSongIdNotifier.value));

      List<ResMusicDataModel> newlistMusic = listMusic;
      newlistMusic[indexMusic] = newlistMusic[indexMusic].copyWith(idLike: "1");
      setValue(musicListLocal, jsonEncode(newlistMusic));
      updateLike();
      // toast("Added to like song");
    }
  }

  void downloadFileVideo({
    required String id,
    required String url,
    required String title,
    // required String image,
    required String duration,
  }) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$id.mp4');
    bool fileExists = await file.exists();

    if (fileExists) {
      toast("File already exists");
      loadingBtnVideo.value = false;
    } else {
      print("-------------Masuk download---------------");

      try {
        await dio.downloadUri(
          Uri.parse(url),
          file.path,
          options: Options(
              responseType: ResponseType.stream,
              followRedirects: true,
              validateStatus: (status) {
                return status! < 500;
              }),
          onReceiveProgress: (received, total) {
            loadingBtnVideo.value = false;
            if (total != -1) {
              progreesVideo.value = (received / total * 100).toStringAsFixed(0);
              progreesDouble.value = (received / total * 1);
            } else {
              progreesDouble.value = null;
            }
          },
        ).then((value) {
          setCacheDownload(
              id: id.validate(),
              path: file.path,
              title: title.validate(),
              image: id.validate().imageUrlYoutube,
              duration: duration.validate());
          toast("Download Complete");
          progreesVideo.value = "";
          progreesDouble.value = null;
        });
        loadingBtnVideo.value = false;
      } catch (e) {
        loadingBtnVideo.value = false;
        toast("Download error");
        progreesVideo.value = "";
        progreesDouble.value = null;
      }
    }
  }

  void downloadFileAudio({
    required String id,
    required String url,
    required String title,
    // required String image,
    required String duration,
  }) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$id.mp3');
    bool fileExists = await file.exists();

    if (fileExists) {
      toast("File already exists");
      loadingBtnVideo.value = false;
    } else {
      print("-------------Masuk download---------------");

      try {
        await dio.downloadUri(
          Uri.parse(url),
          file.path,
          options: Options(
              responseType: ResponseType.stream,
              followRedirects: true,
              validateStatus: (status) {
                return status! < 500;
              }),
          onReceiveProgress: (received, total) {
            loadingBtnVideo.value = false;
            if (total != -1) {
              progreesAudio.value = (received / total * 100).toStringAsFixed(0);
              progreesDouble.value = (received / total * 1);
            } else {
              progreesDouble.value = null;
            }
          },
        ).then((value) {
          setCacheDownload(
              id: id.validate(),
              path: file.path,
              title: title.validate(),
              image: id.validate().imageUrlYoutube,
              duration: duration.validate());
          toast("Download Complete");
          progreesAudio.value = "";
          progreesDouble.value = null;
        });
        loadingBtnVideo.value = false;
      } catch (e) {
        loadingBtnVideo.value = false;
        toast("Download error");
        progreesAudio.value = "";
        progreesDouble.value = null;
      }
    }
  }

  void setCacheDownload({
    required String id,
    required String path,
    required String title,
    required String image,
    required String duration,
  }) async {
    var listDownloaded = getDownloadedListFromSharePref();
    // int indexMusic = listMusic.indexWhere(((e) => e.id == idMusic));
    List<ResDownloadedModel> newlistDownloaded = listDownloaded;

    var abc = ResDownloadedModel(
        id: id, path: path, title: title, image: image, duration: duration);
    newlistDownloaded.add(abc);

    setValue(downloadedListLocal, jsonEncode(newlistDownloaded));
  }

  @override
  void onClose() {
    super.onClose();
    ad?.dispose();
    _connectivitySubscription.cancel();
    audioPlayer.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.detached) {
      audioPlayer
          .stop(); // Audio player is a custom class with resume and pause static methods
    } else {
      // audioPlayer.pause();
    }
  }
}
