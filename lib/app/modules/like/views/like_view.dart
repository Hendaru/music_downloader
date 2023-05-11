import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/network_utils.dart';
import 'package:music_download_youtube/app/utils/widgets/item_music_widget/view/item_music_widget.dart';
import 'package:music_download_youtube/r.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../controllers/like_controller.dart';

class LikeView extends GetView<LikeController> {
  const LikeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
        body: Obx(
      () => SafeArea(
        child: controller.like.isNotEmpty
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPaddingHorizontalGlobal),
                child: Column(
                  children: controller.like.map((e) {
                    return ItemMusicWidget(
                      itemMusic: e,
                      isPlay: Get.find<DasboardController>()
                              .currentSongIdNotifier
                              .value ==
                          e.id,
                      onDelete: () async => await showDialogBox(
                          context,
                          "Delete Music",
                          "Are you sure you want to delete?", onCall: () {
                        controller.delateLikeList(e);
                      }, onCancelCall: () {
                        Get.back();
                      }),
                      onTapPlay: () async {
                        if (await isNetworkAvailable() ||
                            !e.localLagu.isEmptyOrNull) {
                          if (Get.isRegistered<DasboardController>()) {
                            DasboardController controllerDasboard = Get.find();
                            controllerDasboard.initPlaylist(
                                id: e.id, statusPlay: StatusToPlay.SINGLE);
                          }

                          // Future.delayed(const Duration(seconds: 5), () {
                          //   openAdShowReward();
                          // });
                        } else {
                          toast("Not internet connection");
                        }
                      },
                    );
                  }).toList(),
                )).marginOnly(top: 2.h)
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(MainAssets.astro,
                        animate: true,
                        width: 80.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => SizedBox(
                              child: Text(error.toString()),
                            )),
                    3.h.height,
                    Text(
                      "No favorite songs",
                      style: boldTextStyle(size: 16.sp),
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
