import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:music_download_youtube/app/modules/downloaded/controllers/downloaded_controller.dart';
import 'package:music_download_youtube/app/routes/app_pages.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

class AudioDownloadedView extends GetView<DownloadedController> {
  const AudioDownloadedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          1.5.w.width,
          VerticalDivider(
            color: primaryColor,
            width: 1.w,
            thickness: 1.w,
          ).withHeight(20.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              1.h.height,
              Text(
                "Audio",
                style: extraBoldTextStyle(size: 18.sp),
              ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
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
                            "No downloaded video or audio",
                            style: boldTextStyle(),
                          ),
                          1.h.height,
                          Text(
                            "Download your favorite audio",
                            style: secondaryTextStyle(),
                          ),
                        ],
                      ),
                    ).paddingOnly(
                      right: defaultPaddingHorizontalGlobal, left: 2.w)
                  : Column(
                      children: controller.newlistAudioDownloaded
                          .map(
                            (e) => Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                commonCacheImageWidget(e.image.validate(),
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
                            ).marginOnly(top: 2.h).onTap(() {
                              Get.toNamed(
                                Routes.DETAIL_DOWNLOADED_VIDEO,
                                arguments: {
                                  "video_detail": e,
                                },
                              );
                            }),
                          )
                          .toList(),
                    )
                      .withScroll(
                          reverse: false, physics: BouncingScrollPhysics())
                      .paddingOnly(
                          right: defaultPaddingHorizontalGlobal, left: 2.w))
            ],
          ).expand(),
        ],
      ),
    );
  }
}
