import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_playlist_model/res_playlist_model.dart';
import 'package:music_download_youtube/app/utils/admob.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/widgets/create_playlist_widget/add_play_list_widget.dart';

class PlayListController extends GetxController {
  final playlist = <ResPlaylistModel>[].obs;
  final listMusic = <ResMusicDataModel>[].obs;

  BannerAd? _ad;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onClose() {
    super.onInit();
    _ad?.dispose();
  }

  init() {
    getPlaylist();
  }

  Widget showBannerAdsPlayList({required AdSize adSize}) {
    return Center(
      child: SizedBox(
        height: adSize.height.toDouble(),
        width: adSize.width.toDouble(),
        child: AdWidget(
          ad: BannerAd(
            adUnitId: getBannerAdUnitId()!,
            size: adSize,
            request: const AdRequest(),
            listener: BannerAdListener(
              onAdLoaded: ((ad) {
                _ad = ad as BannerAd;
              }),
              onAdFailedToLoad: (ad, error) {
                ad.dispose();
              },
            ),
          )..load(),
        ),
      ),
    );
  }

  void getPlaylist() {
    String? getPlayListString = getStringAsync(playlistSharePref);
    playlist.clear();
    if (!getPlayListString.isEmptyOrNull) {
      playlist.value = (jsonDecode(getPlayListString) as List<dynamic>)
          .map<ResPlaylistModel>((e) => ResPlaylistModel.fromJson(e))
          .toList();
    }
  }

  void getListMusic(ResPlaylistModel detailPlaylist) {
    listMusic.value = detailPlaylist.listMusic;
  }

  void deletePlaylist(ResPlaylistModel playListData) {
    playlist.removeWhere(
        (element) => element.idPlayList == playListData.idPlayList);
    setValue(playlistSharePref, jsonEncode(playlist)).whenComplete(() {
      init();
      Get.back();
    });
  }

  void deleteItemMusic(
      ResPlaylistModel playListData, ResMusicDataModel musicItem) {
    var detailPlaylist = playlist.firstWhereOrNull(
        (element) => element.idPlayList == playListData.idPlayList);

    if (detailPlaylist != null) {
      listMusic.value = detailPlaylist.listMusic.toList();
      listMusic.removeWhere((element) => element.id == musicItem.id);

      var finalplaylist = detailPlaylist.copyWith(listMusic: listMusic);

      var indexPlaylist = playlist.indexWhere(
          (element) => element.idPlayList == finalplaylist.idPlayList);

      playlist[indexPlaylist] = finalplaylist;

      setValue(playlistSharePref, jsonEncode(playlist)).whenComplete(() {
        init();
        Get.back();
      });
    }
  }

  void addPlaylist(BuildContext context) {
    Get.bottomSheet(
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            const AddPlayListWidget())
        .whenComplete(() => getPlaylist());
  }

  //   void setLikeMusic() {
  //   if (detailMusic != null) {
  //     List<ResMusicModel> lisLiketMusic =
  //         like.map((e) => e.copyWith()).toList();
  //     lisLiketMusic.add(detailMusic!);
  //     like.value = lisLiketMusic;
  //     setValue(likeSharePref, jsonEncode(like));
  //     toast("Added to like song");
  //   }
  // }
}
