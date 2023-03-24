import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/data/models/response/res_playlist_model/res_playlist_model.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';

class AddPlayListController extends GetxController {
  TextEditingController playlistTextController = TextEditingController();
  GlobalKey<FormState> addPlaylistformKey = GlobalKey<FormState>();
  List<ResPlaylistModel> playlist = [];

  @override
  void onInit() {
    super.onInit();
    getPlaylist();
  }

  void createPlayList() {
    if (addPlaylistformKey.currentState!.validate()) {
      getPlaylist();
      var abc = ResPlaylistModel(
          idPlayList:
              "playlist-${playlistTextController.text.toLowerCase().addRondomNumber}",
          namePlayList: playlistTextController.text,
          image: "");
      playlist.add(abc);

      setValue(playlistSharePref, jsonEncode(playlist));
      playlistTextController.clear();
      Get.back();
    }
  }

  void getPlaylist() {
    String? getPlayListString = getStringAsync(playlistSharePref);
    if (!getPlayListString.isEmptyOrNull) {
      playlist = (jsonDecode(getPlayListString) as List<dynamic>)
          .map<ResPlaylistModel>((e) => ResPlaylistModel.fromJson(e))
          .toList();
    }
  }
}
