import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/core/utils/event_manager.dart';
import 'package:music_download_youtube/app/core/utils/event_manager_ext.dart';
import 'package:music_download_youtube/app/data/models/response/res_url_video_model/res_url_video_model.dart';
import 'package:music_download_youtube/app/data/repository/music_repository.dart';
import 'package:music_download_youtube/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtube_data_api/youtube_data_api.dart';

class DetailVideoController extends GetxController {
  YoutubeDataApi youtubeDataApi = YoutubeDataApi();
  VideoPlayerController? videoPlayerController;
  Rxn<ChewieController>? chewieController = Rxn<ChewieController>();
  final _musicRepository = MusicRepository();
  final getUrlVideoEvent = InitializeEvent<ResUrlVideoModel>();
  final getUrlAudioEvent = InitializeEvent<ResUrlVideoModel>();

  final errorVideo = false.obs;

  int? bufferDelay;

  final videosTrending = <Video>[].obs;
  final loadingTranding = false.obs;
  final loadingVideo = false.obs;
  final loadingAudio = false.obs;
  final downloadLoad = false.obs;
  final initialLoading = false.obs;

  Rxn<Video> detailVideoData = Rxn<Video>();

  Rxn<ResUrlVideoModel> resUrlVideoModel = Rxn<ResUrlVideoModel>();
  Rxn<ResUrlVideoModel> resUrlAudioModel = Rxn<ResUrlVideoModel>();

  String? urlVideo;
  String? urlDownloaded;
  String? idVideo;
  String? idOriginal;
  final videoDownload = false.obs;

  DasboardController? dasboardController;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    getArgs();
    observer();
    if (detailVideoData.value != null) {
      initialLoading.value = true;
      getUrlVideoController(
          detailVideoData.value?.videoId.validate() ?? "", 18);
      getSuggestions();
    }
  }

  void getArgs() {
    final args = Get.arguments;
    if (args != null) {
      if (args["video"] != null) {
        detailVideoData.value = args["video"];
      }
    }
  }

  void observer() {
    getUrlVideoEvent.result.listen((p0) {
      if (p0.status == Status.SUCCESS) {
        if (p0.data != null) {
          if (p0.data?.data != null) {
            initialLoading.value = false;
            loadingVideo.value = false;
            loadingAudio.value = false;

            if (downloadLoad.value) {
              urlDownloaded = p0.data!.data!.url.validate();
              if (videoDownload.value) {
                dasboardController!.downloadFileVideo(
                  id: idVideo.validate(),
                  idOriginal: idOriginal.validate(),
                  url: urlDownloaded.validate(),
                  image:
                      detailVideoData.value?.thumbnails?.first.url.validate() ??
                          "",
                  title: detailVideoData.value?.title.validate() ?? "",
                  duration: detailVideoData.value?.duration.validate() ?? "",
                );
              } else {
                dasboardController!.downloadFileAudio(
                  id: idVideo.validate(),
                  idOriginal: idOriginal.validate(),
                  url: urlDownloaded.validate(),
                  image:
                      detailVideoData.value?.thumbnails?.first.url.validate() ??
                          "",
                  title: detailVideoData.value?.title.validate() ?? "",
                  duration: detailVideoData.value?.duration.validate() ?? "",
                );
              }
            } else {
              urlVideo = p0.data!.data!.url.validate();
              getDetailVideo();
            }
          }
        }
      } else if (p0.status == Status.LOADING) {
      } else if (p0.status == Status.ERROR) {
        toast('Server error or select another video');
      }
    });
    getUrlAudioEvent.result.listen((p0) {
      if (p0.status == Status.SUCCESS) {
        if (p0.data != null) {
          if (p0.data?.data != null) {}
        }
      } else if (p0.status == Status.LOADING) {
      } else if (p0.status == Status.ERROR) {
        toast('Server error');
      }
    });
  }

  void getUrlVideoController(String id, int tag) {
    _musicRepository
        .getUrlRepository(id, tag)
        .addEvent(event: getUrlVideoEvent);
  }

  // void getUrlAudioController(String id, int tag) {
  //   _musicRepository
  //       .getUrlRepository(id, tag)
  //       .addEvent(event: getUrlAudioEvent);
  // }

  Future<void> getSuggestions() async {
    loadingTranding.value = true;

    var abc = await youtubeDataApi.fetchTrendingVideo();
    var reversed = abc.reversed.toList();
    videosTrending.value = reversed;
    loadingTranding.value = false;
  }

  void getDetailVideo() {
    try {
      videoPlayerController = VideoPlayerController.network(urlVideo.validate(),
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

          errorVideo.value = true;
        });
    } catch (e) {
      print("---------------error2----------------");

      errorVideo.value = true;
    }
  }

  void downloadVideo(DasboardController dasboardControllerOk) {
    downloadLoad.value = true;
    loadingVideo.value = true;
    videoDownload.value = true;
    dasboardController = dasboardControllerOk;
    idOriginal = detailVideoData.value?.videoId.validate() ?? "";
    idVideo = "video-${detailVideoData.value?.videoId.validate() ?? ""}";

    getUrlVideoController(detailVideoData.value?.videoId.validate() ?? "", 22);
  }

  void downloadAudio(DasboardController dasboardControllerOk) {
    downloadLoad.value = true;
    loadingAudio.value = true;
    videoDownload.value = false;
    dasboardController = dasboardControllerOk;
    idOriginal = detailVideoData.value?.videoId.validate() ?? "";

    idVideo = "audio-${detailVideoData.value?.videoId.validate() ?? ""}";
    getUrlVideoController(detailVideoData.value?.videoId.validate() ?? "", 140);
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
