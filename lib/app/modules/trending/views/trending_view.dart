import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

import '../controllers/trending_controller.dart';

class TrendingView extends GetView<TrendingController> {
  const TrendingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
        body: Obx(
      () => controller.loadingTreading.value
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                backgroundColor: Platform.isAndroid ? Colors.transparent : null,
              ),
            )
          : Column(
              children: controller.videosTrending
                  .map(
                    (e) => Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        commonCacheImageWidget(e.thumbnails?[0].url.validate(),
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
                    ).marginOnly(bottom: 2.h),
                  )
                  .toList(),
            )
              .withScroll(
                  physics: BouncingScrollPhysics(),
                  reverse: false,
                  padding: EdgeInsets.symmetric(vertical: 2.h))
              .paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
    ));
  }
}
