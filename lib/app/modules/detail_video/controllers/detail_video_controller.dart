import 'dart:convert';
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/data/models/response/res_downloaded_model/res_downloaded_model.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtube_data_api/youtube_data_api.dart';

class DetailVideoController extends GetxController {
  YoutubeDataApi youtubeDataApi = YoutubeDataApi();
  late VideoPlayerController videoPlayerController;
  Rxn<ChewieController>? chewieController = Rxn<ChewieController>();

  final errorVideo = false.obs;

  int? bufferDelay;

  final videosTrending = <Video>[].obs;
  final loadingTranding = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    getDetailVideo();
    getSuggestions();
  }

  Future<void> getSuggestions() async {
    loadingTranding.value = true;

    var abc = await youtubeDataApi.fetchTrendingVideo();
    var reversed = abc.reversed.toList();
    videosTrending.value = reversed;
    loadingTranding.value = false;
  }

  void getDetailVideo() {
    try {
      videoPlayerController = VideoPlayerController.network(
          "https://rr2---sn-2uuxa3vh-wvbz.googlevideo.com/videoplayback?expire=1683684409&ei=2adaZM1zjby8BO-Bg6AI&ip=36.73.115.9&id=o-APpSFlxynt2w_qVy2I0rKXnJyzbTvhfBmtOzNEN_115b&itag=22&source=youtube&requiressl=yes&mh=ex&mm=31%2C29&mn=sn-2uuxa3vh-wvbz%2Csn-npoe7nsr&ms=au%2Crdu&mv=m&mvi=2&pl=21&initcwndbps=573750&vprv=1&svpuc=1&mime=video%2Fmp4&cnr=14&ratebypass=yes&dur=861.135&lmt=1649854319680150&mt=1683662472&fvip=4&fexp=24007246&c=ANDROID&txp=4532434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Csvpuc%2Cmime%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgVCNoodjpByQVhXcA0LWl2MdZ1pfHJu9IZSBD6qIAxWYCIGEWB5UN5M5vvcglfZjxI4L6JIff7ClIn212jXIA94s7&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRAIgWH0U8HBz-uIGbMyE3wjj0UJwGzbggvqm3AzX1DJu23cCIApSySsAxPYUMoSNKO1fxJuVq6mbmQ1pP-78cpoI0bKv",
          videoPlayerOptions: VideoPlayerOptions())
        ..initialize().then((value) {
          chewieController?.value = ChewieController(
              videoPlayerController: videoPlayerController,
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
          print(videoPlayerController.value.errorDescription);
          errorVideo.value = true;
        });
    } catch (e) {
      print("---------------error2----------------");

      errorVideo.value = true;
    }
  }

  @override
  void onClose() {
    // ytCtrl.dispose();
    videoPlayerController.dispose();
    chewieController?.value?.dispose();
    super.onClose();
  }
}
