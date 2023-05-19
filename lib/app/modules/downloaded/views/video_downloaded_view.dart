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

class VideoDownloadedView extends GetView<DownloadedController> {
  const VideoDownloadedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            1.h.height,
            Text(
              "Video",
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
                          "No downloaded video or audio",
                          style: boldTextStyle(),
                        ),
                        1.h.height,
                        Text(
                          "Download your favorite video",
                          style: secondaryTextStyle(),
                        ),
                      ],
                    ),
                  ).paddingOnly(
                    left: defaultPaddingHorizontalGlobal, right: 2.w)
                : Column(
                    children: controller.newlistVideoDownloaded
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
                              Column(
                                children: [
                                  Text(
                                    e.title.validate(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: boldTextStyle(),
                                  ),
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
                        left: defaultPaddingHorizontalGlobal, right: 2.w))
          ],
        ).expand(),
        VerticalDivider(
          color: primaryColor,
          width: 1.w,
          thickness: 1.w,
        ).withHeight(20.h),
        1.5.w.width,
      ],
    ));
  }
}
