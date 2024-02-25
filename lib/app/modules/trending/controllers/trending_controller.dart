import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:music_download_youtube/app/core/utils/event_manager.dart';
import 'package:music_download_youtube/app/core/utils/event_manager_ext.dart';
import 'package:music_download_youtube/app/data/models/response/res_url_video_model/res_url_video_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_version_download_model/res_version_download_model.dart';
import 'package:music_download_youtube/app/data/repository/music_repository.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:youtube_data_api/models/channel.dart';
import 'package:youtube_data_api/models/playlist.dart';
import 'package:youtube_data_api/models/thumbnail.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtube_data_api/youtube_data_api.dart';
import 'package:http/http.dart' as http;

class TrendingController extends GetxController {
  YoutubeDataApi youtubeDataApi = YoutubeDataApi();

  final _musicRepository = MusicRepository();
  final getUrlVideoAudioEvent = InitializeEvent<ResUrlVideoModel>();
  final getVersionDownloadEvent = InitializeEvent<ResVersionDownloadModel>();
  final InAppReview _inAppReview = InAppReview.instance;

  TextEditingController textSearchController = TextEditingController();

  List<Video> videosTrending = [];
  final suggestionsPrimary = <String>[];
  final videosTemporary = <Video>[].obs;
  var loadingTreading = true.obs;
  var clearText = false.obs;

  // // Search
  // TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    observer();
    getVersionDownloadController();
    loadingTreading.value = true;
    videosTemporary.clear();
    var videosTrendingLocal = await youtubeDataApi.fetchTrendingVideo();
    videosTrending = videosTrendingLocal;
    videosTemporary.value = videosTrendingLocal;
    loadingTreading.value = false;
  }

  void observer() {
    getUrlVideoAudioEvent.result.listen((p0) {
      if (p0.status == Status.SUCCESS) {
        if (p0.data != null) {
          if (p0.data?.data != null) {
            // print(p0.data?.data.);
          }
        }
      } else if (p0.status == Status.LOADING) {
      } else if (p0.status == Status.ERROR) {
        toast('Server error');
      }
    });
    getVersionDownloadEvent.result.listen((p0) async {
      if (p0.status == Status.SUCCESS) {
        if (p0.data != null) {
          if (p0.data!.data != null) {
            DataVersionDownloadModel? version = p0.data?.data
                ?.firstWhereOrNull((v) => v.appName == "MUSIC_DOWNLOAD_1");

            getVersion(version);
          }
        }
      } else if (p0.status == Status.LOADING) {
      } else if (p0.status == Status.ERROR) {}
    });
  }

  Future<void> getVersion(DataVersionDownloadModel? version) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionInfo = packageInfo.version;

    log(version.toString());

    if (version != null) {
      if (version.nameVersion != versionInfo) {
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

  void getVersionDownloadController() {
    _musicRepository
        .getVersionDownloadRepository()
        .addEvent(event: getVersionDownloadEvent);
  }

  Future<void> searchResult(String value) async {
    hideKeyboard();
    loadingTreading.value = true;

    // try {
    //   List<dynamic> videoResult =
    //       await youtubeDataApi.fetchSearchVideo(value, youtubeToken);
    //   videosTemporary.value = [];
    //   videoResult.forEach((element) {
    //     if (element is Video) {
    //       Video video = element;
    //       videosTemporary.add(video);
    //     } else if (element is Channel) {
    //       Channel channel = element;
    //     } else if (element is PlayList) {
    //       PlayList playList = element;
    //     }
    //   });
    // } catch (e) {
    //   videosTemporary.value = videosTrending;
    //   toast("Please search more specific keyword");

    //   print(e);
    // }

    final data = await _musicRepository.getVideolistRealRepository(
      part: "snippet",
      maxResults: "15",
      query: value,
      key: youtubeToken,
      regionCode: "ID",
      type: "video",
    );

    data.fold((l) async {
      loadingTreading.value = false;
      videosTemporary.value = videosTrending;
      toast("Please search more specific keyword");
    }, (r) async {
      videosTemporary.value = [];
      r.forEach((element) async {
        // var playlist = await yt.videos.get(element.id?.videoId);
        videosTemporary.add(Video(
            videoId: element.id?.videoId,
            duration: "0",
            // duration: printDuration(playlist.duration ?? Duration(minutes: 2)),
            title: element.snippet?.title,
            channelName: "",
            views: "",
            thumbnails: [
              Thumbnail(url: element.snippet?.thumbnails?.medium?.url ?? "")
            ]));
      });
      loadingTreading.value = false;
    });
  }

  void clearSearch(TextEditingController textEditingController) {
    textEditingController.clear();
    clearText.value = false;
    hideKeyboard();
  }

  Future<List<String>> autoCompleteSuggestions(String text) async {
    List<String> suggestions = [];
    var getSuggestions = await http.get(Uri.parse(
        'http://suggestqueries.google.com/complete/search?client=youtube&ds=yt&client=firefox&q=$text'));
    final extractedData = json.decode(getSuggestions.body) as List<dynamic>;

    for (var i = 0; i < extractedData[1].length; i++) {
      suggestions.add(extractedData[1][i]);
    }

    if (text.isNotEmpty) {
      clearText.value = true;
    }

    return suggestions;
  }

  void getUrlVideoController(String id, int tag) {
    _musicRepository
        .getUrlRepository(id, tag)
        .addEvent(event: getUrlVideoAudioEvent);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
