import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/core/utils/builder_widget.dart';
import 'package:music_download_youtube/app/data/models/response/res_url_video_model/res_url_video_model.dart';
import 'package:music_download_youtube/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_button.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_decoration.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/unity_ads.dart';
import 'package:music_download_youtube/app/utils/widgets/app_bar_custom_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/error_page_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/shimmer/skeleton_widget.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/detail_video_controller.dart';

class DetailVideoView extends GetView<DetailVideoController> {
  const DetailVideoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DasboardController dasboardController = Get.put(DasboardController());
    UnityInitializerController controllerUnity =
        Get.put(UnityInitializerController());
    Future.delayed(Duration(seconds: 2), () {
      controllerUnity.bannerDetailVideovisible.value = true;
    });
    return Scaffold(
        appBar: const AppBarCustomWidget(
          title: "Detail Video",
          centerTitle: true,
        ),
        body: Obx(() => controller.initialLoading.value
            ? Column(
                children: [
                  SkeletonWidget(height: 25.h, width: 100.w),
                  3.h.height,
                  SkeletonWidget(height: 5.h, width: 100.w),
                  3.h.height,
                  SkeletonWidget(height: 5.h, width: 100.w),
                  3.h.height,
                  SkeletonWidget(height: 5.h, width: 100.w),
                ],
              ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal)
            : contentWidget(dasboardController, context, controllerUnity)));
  }

  Widget contentWidget(DasboardController dasboardController,
      BuildContext context, UnityInitializerController controllerUnity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => controller.errorVideo.value
            ? Container(
                width: 100.w,
                height: 25.h,
                color: greyBgLightColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(MainAssets.ic_video_error, width: 15.w),
                    Text("Video not found", style: boldTextStyle())
                  ],
                ),
              )
            :
            // YoutubePlayer(
            //     controller: controller.ytController,
            //     showVideoProgressIndicator: true,
            //     progressIndicatorColor: Colors.red,
            //     progressColors: ProgressBarColors(
            //       playedColor: Colors.red,
            //       handleColor: Colors.red,
            //     ),
            //   )
            controller.chewieController?.value != null
                ? Chewie(
                    controller: controller.chewieController!.value!,
                  ).withSize(height: 30.h, width: 100.w)
                : SkeletonWidget(
                    height: 25.h,
                    width: 100.w,
                  ).paddingSymmetric(
                    horizontal: defaultPaddingHorizontalGlobal)),
        2.h.height,
        Text(
          controller.detailVideoData.value?.title.validate() ?? "",
          style: boldTextStyle(),
        ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
        2.h.height,
        Obx(() => controller.loadingTranding.value
            ? Center(
                child: Column(
                children: [
                  SkeletonWidget(height: 5.h, width: 100.w),
                  3.h.height,
                  SkeletonWidget(height: 5.h, width: 100.w),
                  3.h.height,
                  SkeletonWidget(height: 5.h, width: 100.w),
                ],
              ))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Obx(() => AppButtonWidget(
                            onTap: () {
                              if (dasboardController.progreesDouble.value ==
                                  null) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  openAdShowReward();
                                });
                                controller.downloadVideo(dasboardController);
                              } else {
                                toast("Please wait download finish");
                              }
                            },
                            text: dasboardController.idDownload !=
                                    controller.detailVideoData.value?.videoId
                                ? "Download Video"
                                : dasboardController.progreesVideo.value.isEmpty
                                    ? "Download Video"
                                    : "${dasboardController.progreesVideo.value}%",
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            textStyle: boldTextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant),

                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            enableScaleAnimation: false,
                            enabled: !controller.errorVideo.value,
                            // loadingColor: primaryColor,
                            loading: controller.loadingVideo.value,
                            shapeBorder: RoundedRectangleBorder(
                                borderRadius: radius(defaultRadius)),
                          )).expand(),
                      2.w.width,
                      Obx(() => AppButtonWidget(
                            onTap: () {
                              if (dasboardController.progreesDouble.value ==
                                  null) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  openAdShowReward();
                                });
                                controller.downloadAudio(dasboardController);
                              } else {
                                toast("Please wait download finish");
                              }
                            },
                            text: dasboardController.idDownload !=
                                    controller.detailVideoData.value?.videoId
                                ? "Download Audio"
                                : dasboardController.progreesAudio.value.isEmpty
                                    ? "Download Audio"
                                    : "${dasboardController.progreesAudio.value}%",
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            textStyle: boldTextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant),
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            enableScaleAnimation: false,
                            enabled: !controller.errorVideo.value,
                            loading: controller.loadingAudio.value,
                            shapeBorder: RoundedRectangleBorder(
                                borderRadius: radius(defaultRadius)),
                          )).expand(),
                    ],
                  ),
                  1.h.height,
                  Obx(
                    () => dasboardController.idDownload !=
                            controller.detailVideoData.value?.videoId
                        ? Divider(
                            thickness: 4.0,
                          )
                        : dasboardController.progreesDouble.value == null
                            ? Divider(
                                thickness: 4.0,
                              )
                            : LinearProgressIndicator(
                                value: dasboardController.progreesDouble.value,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.amber),
                                backgroundColor:
                                    Theme.of(context).colorScheme.background,
                              ),
                  ),
                  Obx(() => controllerUnity
                      .banner(BannerSize.leaderboard)
                      .marginOnly(bottom: 1.h)
                      .visible(controllerUnity.bannerDetailVideovisible.value)),
                  1.h.height,
                  Text(
                    "Popular Videos",
                    style: boldTextStyle(),
                  ),
                  1.h.height,
                  Column(
                    children: controller.videosTrending
                        .map(
                          (e) => Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              commonCacheImageWidget(
                                      e.thumbnails?[0].url.validate(),
                                      width: 30.w,
                                      // idcacheKey: element.idPlayList.validate(),
                                      fit: BoxFit.cover,
                                      isSquere: false)
                                  .cornerRadiusWithClipRRect(3.w),
                              3.w.width,
                              Text(
                                e.title.validate(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: boldTextStyle(),
                              ).expand(),
                              SvgPicture.asset(MainAssets.ic_more_more,
                                      width: 4.w,
                                      height: 4.w,
                                      // ignore: unrelated_type_equality_checks
                                      color: greyColor)
                                  .withWidth(10.w)
                            ],
                          ).marginOnly(bottom: 2.h).onTap(() {
                            // if (controller.videoPlayerController != null) {
                            //   controller.videoPlayerController!.dispose();
                            //   controller.chewieController?.value?.dispose();
                            // }
                            // if (controller.ytController != null) {
                            //   controller.videoPlayerController!.dispose();
                            //   controller.chewieController?.value?.dispose();
                            // }
                            // controller.ytController.reload();
                            // controller.ytController.dispose();
                            controller.detailVideoData.value = e;

                            // controller.youtubePlayerCon();
                            controller.ytController.load(e.videoId ?? "");
                            // controller.getUrlVideoController(
                            //     e.videoId.validate(), 18);
                            controller.errorVideo.value = false;
                            controller.scrollController.animateTo(0.0,
                                curve: Curves.easeOut,
                                duration: const Duration(milliseconds: 300));
                          }),
                        )
                        .toList(),
                  ),
                ],
              )).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal)
      ],
    ).withScroll(
        physics: BouncingScrollPhysics(),
        reverse: false,
        controller: controller.scrollController,
        padding: EdgeInsets.symmetric(vertical: 1.h));
  }
}
