import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/widgets/add_like_playlist/add_like_playlist_widget.dart';

class ListAllMusicController extends GetxController {
  TextEditingController searchYoutube = TextEditingController();
  final listMusicHome = <ResMusicDataModel>[].obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    getMusicListAll();
  }

  getMusicListAll() {
    listMusicHome.clear();

    listMusicHome.value = getMusicListFromSharePref();
    // listMusicHome.shuffle();
    // List<ResMusicDataModel> abc = listMusicHome.reversed.map((e) => e).toList();
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
}
