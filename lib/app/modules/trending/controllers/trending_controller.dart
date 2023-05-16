import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:youtube_data_api/models/channel.dart';
import 'package:youtube_data_api/models/playlist.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtube_data_api/youtube_data_api.dart';
import 'package:http/http.dart' as http;

class TrendingController extends GetxController {
  YoutubeDataApi youtubeDataApi = YoutubeDataApi();

  List<Video> videosTrending = [];
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
    loadingTreading.value = true;
    videosTemporary.clear();
    var videosTrendingLocal = await youtubeDataApi.fetchTrendingVideo();
    videosTrending = videosTrendingLocal;
    videosTemporary.value = videosTrendingLocal;
    loadingTreading.value = false;
  }

  Future<void> searchResult(String value) async {
    hideKeyboard();
    loadingTreading.value = true;

    try {
      List<dynamic> videoResult =
          await youtubeDataApi.fetchSearchVideo(value, youtubeToken);
      videosTemporary.value = [];
      videoResult.forEach((element) {
        if (element is Video) {
          Video video = element;
          videosTemporary.add(video);
        } else if (element is Channel) {
          Channel channel = element;
        } else if (element is PlayList) {
          PlayList playList = element;
        }
      });
    } catch (e) {
      videosTemporary.value = videosTrending;
      toast("Please search more specific keyword");

      print(e);
    }

    loadingTreading.value = false;
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
