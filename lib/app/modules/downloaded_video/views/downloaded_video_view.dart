import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:music_download_youtube/app/routes/app_pages.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

import '../controllers/downloaded_video_controller.dart';

class DownloadedVideoView extends GetView<DownloadedVideoController> {
  const DownloadedVideoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          1.h.height,
          Text(
            "Video Downloaded",
            style: extraBoldTextStyle(size: 18.sp),
          ).paddingOnly(left: defaultPaddingHorizontalGlobal, right: 2.w),
          1.h.height,
          Obx(() => controller.newlistVideoDownloaded.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(MainAssets.astro,
                          animate: true,
                          width: 80.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              SizedBox(
                                child: Text(error.toString()),
                              )),
                      6.h.height,
                      Text(
                        "No downloaded video",
                        style: boldTextStyle(),
                      ),
                      1.h.height,
                      Text(
                        "Download your favorite video",
                        style: secondaryTextStyle(),
                      ),
                    ],
                  ),
                )
                  .paddingSymmetric(
                    horizontal: defaultPaddingHorizontalGlobal,
                  )
                  .expand()
              : Column(
                  children: controller.newlistVideoDownloaded
                      .map(
                        (e) => Slidable(
                          key: ValueKey(e.id),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(onDismissed: () {}),
                            dragDismissible: false,
                            extentRatio: 0.6,
                            children: [
                              Container(
                                color: Color(0xFFFE4A49),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      MainAssets.ic_trash,
                                      color: whiteColor,
                                    ),
                                    0.5.h.height,
                                    Text("Delete",
                                        style: boldTextStyle(
                                            color: whiteColor, size: 10.sp)),
                                  ],
                                ),
                              ).onTap(() {
                                showDialogBox(
                                  Get.context,
                                  "Delete video",
                                  "Are you sure want to delete this video?",
                                  onCall: () {
                                    delFileAudioVideo(e,
                                        deleteFileAudioCallback: (e) {
                                      if (e) {
                                        Get.back();
                                        controller.init();
                                      }
                                    });
                                  },
                                  onCancelCall: () {
                                    Get.back();
                                  },
                                );
                              }).expand(),
                              Container(
                                width: 20.w,
                                color: Colors.amber,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      MainAssets.ic_share,
                                      width: 6.w,
                                      height: 6.w,
                                      color: whiteColor,
                                    ),
                                    0.5.h.height,
                                    Text("Copy",
                                        style: boldTextStyle(
                                            color: whiteColor, size: 10.sp)),
                                  ],
                                ),
                              ).onTap(() {
                                copyFileVideo(e);
                              }).expand(),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              commonCacheImageWidget(e.image.validate(),
                                      width: 30.w,
                                      // idcacheKey: element.idPlayList.validate(),
                                      fit: BoxFit.cover,
                                      isSquere: false)
                                  .cornerRadiusWithClipRRect(3.w),
                              3.w.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.title.validate(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: boldTextStyle(),
                                  ),
                                  0.5.h.height,
                                  Text(
                                    e.duration.validate(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: secondaryTextStyle(),
                                  ),
                                ],
                              ).expand(),
                              SvgPicture.asset(MainAssets.ic_arrow_left,
                                  width: 12.w,

                                  // ignore: unrelated_type_equality_checks
                                  color: greyColor)
                            ],
                          ).onTap(() {
                            Future.delayed(const Duration(seconds: 1), () {
                              openAdShowReward();
                            });
                            Get.toNamed(
                              Routes.DETAIL_DOWNLOADED_VIDEO,
                              arguments: {
                                "video_detail": e,
                              },
                            );
                          }),
                        ).marginOnly(bottom: 1.h),
                      )
                      .toList(),
                )
                  .withScroll(reverse: false, physics: BouncingScrollPhysics())
                  .paddingSymmetric(
                    horizontal: defaultPaddingHorizontalGlobal,
                  )).expand()
        ],
      ),
    );
  }
}
