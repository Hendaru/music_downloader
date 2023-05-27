import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_download_youtube/app/data/models/response/res_downloaded_model/res_downloaded_model.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class DetailDownloadedVideoController extends FullLifeCycleController
    with FullLifeCycleMixin {
  Rxn<ChewieController>? chewieController = Rxn<ChewieController>();
  VideoPlayerController? videoPlayerController;

  Rxn<ResDownloadedModel>? detailVideoData = Rxn<ResDownloadedModel>();

  int? bufferDelay;

  final newlistVideoDownloaded = <ResDownloadedModel>[].obs;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void onInit() {
    // var listDownloaded = getDownloadedListFromSharePref();
    // print("---------------------------------");
    // print(listDownloaded);

    init();
    super.onInit();
  }

  void init() {
    getArgs();
    getDetailVideo();
    var listDownloaded = getDownloadedListFromSharePref();
    // int indexMusic = listMusic.indexWhere(((e) => e.id == idMusic));

    List<ResDownloadedModel> abc = listDownloaded
        .where((element) => element.id!.contains("video"))
        .toList();
    abc.shuffle();
    if (abc.length < 5) {
      newlistVideoDownloaded.value = abc;
    } else {
      for (var i = 0; i < 5; i++) {
        newlistVideoDownloaded.add(abc[i]);
      }
    }
  }

  void getArgs() {
    final args = Get.arguments;
    if (args != null) {
      if (args["video_detail"] != null) {
        detailVideoData?.value = args["video_detail"];
      }
    }
  }

  void shareFileVideo() async {
    var statusForder = await Permission.storage.status;

    if (statusForder.isDenied) {
      await Permission.storage.request();
    } else if (statusForder.isGranted) {
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory != null) {
        // String fileName = detailVideoData!.path!.split('/').last;
        File(detailVideoData?.value?.path ?? "").copy(
            selectedDirectory + "/" + detailVideoData!.value!.title! + ".mp4");
      }
    } else if (statusForder.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  void getDetailVideo() {
    try {
      videoPlayerController = VideoPlayerController.file(
          File(detailVideoData?.value?.path ?? ""),
          videoPlayerOptions: VideoPlayerOptions())
        ..initialize().then((value) {
          chewieController?.value = ChewieController(
              videoPlayerController: videoPlayerController!,
              autoPlay: false,
              looping: false,
              aspectRatio: 16 / 9,
              progressIndicatorDelay: bufferDelay != null
                  ? Duration(milliseconds: bufferDelay!)
                  : null,
              errorBuilder: (context, errorMessage) => Center(
                    child: Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
              materialProgressColors: ChewieProgressColors(
                playedColor: Colors.red,
                handleColor: Colors.amber,
                backgroundColor: Colors.grey,
                bufferedColor: Colors.black12,
              ),
              // placeholder: Container(
              //   color: Colors.grey,
              // ),
              autoInitialize: true,
              showOptions: false);

          audioPlayer.setAudioSource(AudioSource.uri(
            Uri.file(detailVideoData?.value?.path ?? ""),
            tag: MediaItem(
              // Specify a unique ID for each media item:
              id: detailVideoData?.value?.id.validate() ?? "",
              // Metadata to display in the notification:
              album: detailVideoData?.value?.duration.validate() ?? "",
              title: detailVideoData?.value?.title.validate() ?? "",
              artUri: Uri.parse(detailVideoData?.value?.image.validate() ?? ""),
            ),
          ));
        }).catchError((e) {
          print("---------------error----------------");
        });
    } catch (e) {
      print("---------------error2----------------");
    }
  }

  @override
  void onClose() {
    // ytCtrl.dispose();
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
      chewieController?.value?.dispose();
      audioPlayer.dispose();
    }

    super.onClose();
  }

  @override
  void onDetached() {
    audioPlayer.dispose();
  }

  @override
  void onInactive() {
    print("-------------------onInactive----------------------");
  }

  @override
  void onPaused() {
    audioPlayer
        .seek(videoPlayerController?.value.position ?? Duration.zero)
        .whenComplete(() => audioPlayer.play());
  }

  @override
  void onResumed() {
    audioPlayer.pause();
  }
}
