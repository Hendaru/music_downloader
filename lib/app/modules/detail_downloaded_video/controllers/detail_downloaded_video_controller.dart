import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:video_player/video_player.dart';

class DetailDownloadedVideoController extends GetxController {
  Rxn<ChewieController>? chewieController = Rxn<ChewieController>();
  VideoPlayerController? videoPlayerController;

  int? bufferDelay;
  @override
  void onInit() {
    // var listDownloaded = getDownloadedListFromSharePref();
    // print("---------------------------------");
    // print(listDownloaded);
    getDetailVideo();
    super.onInit();
  }

  void getDetailVideo() {
    try {
      videoPlayerController = VideoPlayerController.file(
          File(
              "/data/user/0/com.offline.music.downloader/app_flutter/video-ynOtYmpZxak.mp4"),
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
    }

    super.onClose();
  }
}
