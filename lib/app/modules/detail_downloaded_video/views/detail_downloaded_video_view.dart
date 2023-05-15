import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/widgets/app_bar_custom_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/shimmer/skeleton_widget.dart';
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
      body: Obx(() => controller.chewieController?.value != null
          ? Chewie(
              controller: controller.chewieController!.value!,
            ).withSize(height: 30.h, width: 100.w)
          : SkeletonWidget(
              height: 25.h,
              width: 100.w,
            ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal)),
    );
  }
}
