import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/widgets/app_bar_custom_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/shimmer/skeleton_widget.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

import '../controllers/detail_downloaded_video_controller.dart';

class DetailDownloadedVideoView
    extends GetView<DetailDownloadedVideoController> {
  const DetailDownloadedVideoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustomWidget(
        title: "Detail Video downloaded",
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => controller.chewieController?.value != null
              ? Chewie(
                  controller: controller.chewieController!.value!,
                ).withSize(height: 30.h, width: 100.w)
              : SkeletonWidget(
                  height: 25.h,
                  width: 100.w,
                ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal)),
          1.h.height,
          Row(
            children: [
              SvgPicture.asset(MainAssets.ic_share, width: 6.w, height: 6.w),
              1.w.width,
              Text(
                "Copy Video",
                style: primaryTextStyle(),
              ),
            ],
          )
              .paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal)
              .onTap(() {
            controller.shareFileVideo();
          }),
          2.h.height,
          Text(
            controller.detailVideoData?.title.validate() ?? "",
            style: boldTextStyle(),
          ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
          1.h.height,
          const Divider(
            thickness: 4.0,
          ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
          1.h.height,
          Text(
            "Favorite downloaded video",
            style: extraBoldTextStyle(),
          ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
          // Column(
          //   children: [],
          // )
        ],
      ),
    );
  }
}
