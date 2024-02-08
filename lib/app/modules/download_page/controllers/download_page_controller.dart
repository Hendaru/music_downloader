import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/core/utils/event_manager.dart';
import 'package:music_download_youtube/app/core/utils/event_manager_ext.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_url_video_model/res_url_video_model.dart';
import 'package:music_download_youtube/app/data/repository/music_repository.dart';
import 'package:music_download_youtube/app/routes/app_pages.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class DownloadPageController extends FullLifeCycleController
    with FullLifeCycleMixin {
  TextEditingController downloadYoutube = TextEditingController();

  final progrees = ''.obs;
  final progreesDouble = Rxn<double>();
  final loadingBtn = false.obs;

  String videoIdController = '';

  Dio dio = Dio();

  final _musicRepository = MusicRepository();
  final getUrlVideoEvent = InitializeEvent<ResUrlVideoModel>();

  StreamSubscription? _intentDataStreamSubscription;

  final _sharedFiles = <SharedMediaFile>[];

  @override
  void onInit() {
    _intentDataStreamSubscription =
        ReceiveSharingIntent.getMediaStream().listen((value) {
      Future.delayed(const Duration(seconds: 1), () {
        _sharedFiles.clear();
        downloadYoutube.text = value.first.path;
      });
    }, onError: (err) {
      print("getLinkStream error: $err");
    });
    observer();
    _getClipboardText();
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
        ReceiveSharingIntent.getMediaStream().listen((value) {
      Future.delayed(const Duration(seconds: 1), () {
        downloadYoutube.text = value.first.path;
      });
    }, onError: (err) {
      print("getLinkStream error: $err");
    });

    _getClipboardText();
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
      } catch (e) {
        loadingBtn.value = false;
        downloadYoutube.clear();
        toast("Downlod error, please select another url");
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

    // newlistMusic[indexMusic] =
    //     newlistMusic[indexMusic].copyWith(localLagu: urlPath);
    setValue(musicListLocal, jsonEncode(newlistMusic));
    await Future.delayed(const Duration(seconds: 1)).whenComplete(() {
      Get.offAndToNamed(
        Routes.DASBOARD,
      );
    });
  }
}
