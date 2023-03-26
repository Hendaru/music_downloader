import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/widgets/item_playlist_widget.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

import '../controllers/play_list_controller.dart';

class PlayListView extends GetView<PlayListController> {
  const PlayListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.init();
    DasboardController controllerDasboard = Get.put(DasboardController());

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('PlayListView'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Obx(
          () => controller.playlist.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // controller
                      //     .showBannerAdsPlayList(adSize: AdSize.mediumRectangle)
                      //     .paddingOnly(bottom: 3.h),
                      SvgPicture.asset(MainAssets.ic_add,
                          width: 8.w,
                          height: 8.w,
                          // ignore: unrelated_type_equality_checks
                          color: greyColor),
                      1.h.height,
                      Text(
                        'Add Playlist',
                        style: boldTextStyle(size: 10.sp),
                      )
                    ],
                  ),
                ).onTap(() => controller.addPlaylist(context),
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent)
              : Column(
                  children: [
                    2.h.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Playlist',
                          style: boldTextStyle(
                              weight: FontWeight.bold, size: 15.sp),
                        ),
                        SvgPicture.asset(MainAssets.ic_add,
                                width: 8.w,
                                height: 8.w,
                                // ignore: unrelated_type_equality_checks
                                color: greyColor)
                            .onTap(
                          () => controller.addPlaylist(context),
                        ),
                      ],
                    ),
                    2.h.height,
                    SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: controller.playlist
                              .map((element) => ItemPlayListWidget(
                                  itemPlayList: element,
                                  functionItem: (e) {
                                    var listMusic = getMusicListFromSharePref();
                                    var listMusicPlaylist = listMusic
                                        .where((element) =>
                                            element.idPlayList == e.idPlayList)
                                        .toList();
                                    if (listMusicPlaylist.isEmpty) {
                                      toast("Playlist is empty");
                                    } else {
                                      controllerDasboard.initPlaylist(
                                        // listSound: listMusicPlaylist,
                                        id: element.idPlayList,
                                        statusPlay: StatusToPlay.PLAYLIST,
                                      );
                                      // Get.to(
                                      //   PlayerViewDasboard(
                                      //     listSound: listMusicPlaylist,
                                      //     statusPlay: StatusToPlay.PLAYLIST,
                                      //     id: e.idPlayList,
                                      //     playlistModel: element,
                                      //   ),
                                      //   opaque: false,
                                      // );
                                    }
                                  },
                                  functionDelete: (e) async {
                                    await showDialogBox(
                                        context,
                                        "Delete Playlist",
                                        "Are you sure you want to delete?",
                                        onCall: () {
                                      controller.deletePlaylist(e);
                                    }, onCancelCall: () {
                                      Get.back();
                                    });
                                  }
                                  // controller.delete(element),
                                  ))
                              .toList(),
                        )).expand(),
                  ],
                ),
        ),
      ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
    );
  }
}
