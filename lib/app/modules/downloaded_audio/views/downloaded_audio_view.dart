import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:music_download_youtube/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:music_download_youtube/app/routes/app_pages.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

import '../controllers/downloaded_audio_controller.dart';

class DownloadedAudioView extends GetView<DownloadedAudioController> {
  const DownloadedAudioView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DasboardController controllerDasboard = Get.put(DasboardController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          1.h.height,
          Text(
            "Audio Downloaded",
            style: extraBoldTextStyle(size: 18.sp),
          ).paddingOnly(left: defaultPaddingHorizontalGlobal, right: 2.w),
          1.h.height,
          Obx(() => controller.newlistAudioDownloaded.isEmpty
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
                        "No downloaded audio",
                        style: boldTextStyle(),
                      ),
                      1.h.height,
                      Text(
                        "Download your favorite audio",
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
                  children: controller.newlistAudioDownloaded
                      .map(
                        (e) => Slidable(
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
                                  "Detete audio",
                                  "Are you sure want to delete this audio?",
                                  onCall: () {
                                    delFileAudioVideo(e);
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
                                copyFileAudio(e);
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
                              SvgPicture.asset(MainAssets.ic_more_more,
                                      width: 4.w,
                                      height: 4.w,
                                      // ignore: unrelated_type_equality_checks
                                      color: greyColor)
                                  .withWidth(10.w)
                            ],
                          ).onTap(() {
                            controllerDasboard.initPlaylist(
                                // listSound: [e.value],
                                id: e.id,
                                statusPlay: StatusToPlay.SINGLE);
                            // Get.toNamed(
                            //   Routes.DETAIL_DOWNLOADED_VIDEO,
                            //   arguments: {
                            //     "video_detail": e,
                            //   },
                            // );
                          }),
                        ).marginOnly(bottom: 1.h),
                      )
                      .toList(),
                )
                  .withScroll(reverse: false, physics: BouncingScrollPhysics())
                  .paddingSymmetric(
                      horizontal: defaultPaddingHorizontalGlobal)).expand()
        ],
      ),
    );
  }
}
