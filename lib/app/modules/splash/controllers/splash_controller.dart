import 'dart:convert';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/core/utils/event_manager.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/data/repository/music_repository.dart';
import 'package:music_download_youtube/app/routes/app_pages.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';

class SplashController extends GetxController {
  final _musicRepository = MusicRepository();

  final fetchMusicList = InitializeEvent<ResMusicModel>();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    // observe();
    // getMusic();
    // createInterstitialAd();
    // createRewardedAd();
    setValue("rating", false);
    // setValue(musicListLocal, jsonEncode([]));
    String? listMusic = getStringAsync(musicListLocal);

    await Future.delayed(const Duration(seconds: 5)).whenComplete(() {
      Get.offAndToNamed(
        Routes.DASBOARD,
      );
      // if (listMusic.isEmptyOrNull) {
      //   Get.offAndToNamed(
      //     Routes.DOWNLOAD_PAGE,
      //   );
      // } else {
      //   Get.offAndToNamed(
      //     Routes.DASBOARD,
      //   );
      // }
    });
  }

  // void observe() {
  //   fetchMusicList.result.listen((p0) {
  //     toast(p0.status.toString());
  //     if (p0.status == Status.SUCCESS) {
  //       if (p0.data != null) {
  //         String getListMusicFromPref = getStringAsync(musicListLocal);

  //         if (getListMusicFromPref.isEmptyOrNull) {
  //           setValue(musicListLocal, jsonEncode(p0.data?.data ?? []));
  //         } else {
  //           List<ResMusicDataModel> listMusicTemp = [];
  //           List<ResMusicDataModel> listMusicTempNew = [];

  //           listMusicTemp = (jsonDecode(getListMusicFromPref) as List<dynamic>)
  //               .map<ResMusicDataModel>((e) => ResMusicDataModel.fromJson(e))
  //               .toList();

  //           if (p0.data!.data!.length != listMusicTemp.length) {
  //             listMusicTempNew = p0.data!.data!
  //                 .where(((element) =>
  //                     listMusicTemp.every((e) => e.id != element.id)))
  //                 .toList();

  //             for (var newItem in listMusicTempNew) {
  //               listMusicTemp.add(newItem);
  //             }
  //             setValue(musicListLocal, jsonEncode(listMusicTemp));
  //           }
  //         }
  //       }
  //     } else if (p0.status == Status.LOADING) {
  //     } else if (p0.status == Status.ERROR) {}
  //   });
  // }

  // void getMusic() {
  //   _musicRepository.getMusicRepository().addEvent(event: fetchMusicList);
  // }
}
