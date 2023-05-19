import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/data/models/response/res_downloaded_model/res_downloaded_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class DetailDownloadedVideoController extends GetxController {
  Rxn<ChewieController>? chewieController = Rxn<ChewieController>();
  VideoPlayerController? videoPlayerController;

  ResDownloadedModel? detailVideoData;

  int? bufferDelay;

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
  }

  void getArgs() {
    final args = Get.arguments;
    if (args != null) {
      if (args["video_detail"] != null) {
        detailVideoData = args["video_detail"];
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
        File(detailVideoData?.path ?? "")
            .copy(selectedDirectory + "/" + detailVideoData!.title! + ".mp4");
      }
    } else if (statusForder.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  void getDetailVideo() {
    try {
      videoPlayerController = VideoPlayerController.file(
          File(detailVideoData?.path ?? ""),
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
