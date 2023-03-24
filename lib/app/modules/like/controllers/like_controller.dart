import 'dart:convert';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';

class LikeController extends GetxController {
  final like = <ResMusicDataModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    getLikeList();
  }

  void getLikeList() {
    var listMusik = getMusicListFromSharePref();
    like.value = listMusik.where((e) => e.idLike == "1").toList();
  }

  void delateLikeList(ResMusicDataModel detailLike) {
    var listMusic = getMusicListFromSharePref();
    int indexMusic = listMusic.indexWhere(((e) => e.id == detailLike.id));

    List<ResMusicDataModel> newlistMusic = listMusic;
    newlistMusic[indexMusic] = newlistMusic[indexMusic].copyWith(idLike: "");
    setValue(musicListLocal, jsonEncode(newlistMusic)).whenComplete(() {
      init();
      Get.back();
    });

    // like.removeWhere((element) => element.idMusic == detailLike.idMusic);
    // setValue(likeSharePref, jsonEncode(like)).whenComplete(() {
    //   init();
    //   Get.back();
    // });
  }
}
