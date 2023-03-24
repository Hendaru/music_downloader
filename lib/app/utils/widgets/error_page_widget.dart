import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_button.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_decoration.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

class ErrorPageWidget extends StatelessWidget {
  const ErrorPageWidget({
    Key? key,
    this.onPressed,
    this.svgAsset,
    this.textButton,
    this.buttonVisibility = true,
    this.description,
    this.title,
    this.titleBelowImage = false,
    this.hideTitle = false,
  }) : super(key: key);

  final Function()? onPressed;
  final String? svgAsset;
  final String? textButton;
  final bool buttonVisibility;
  final String? description;
  final String? title;
  final bool titleBelowImage;
  final bool hideTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ??
                "sorry! An error has occured and we're fixing the problem. Please try again later.",
            style: boldTextStyle(size: 18.sp),
          ).visible(!titleBelowImage && !hideTitle),
          3.h.height,
          SvgPicture.asset(
            svgAsset ?? MainAssets.warning,
            width: 50.w,
            height: 50.w,
          ),
          Text(
            title ?? "Oops..",
            style: boldTextStyle(),
          ).visible(titleBelowImage),

          2.h.height,
          Text(
            description ??
                "sorry! An error has occured and we're fixing the problem. Please try again later.",
            textAlign: TextAlign.center,
            style: primaryTextStyle(),
          ),
          // TextCustomWidget(
          //   text: description ?? LocaleKeys.error_interruption_moment.tr,
          //   textAlign: TextAlign.center,
          //   style:
          //       MainTexts.blackText.copyWith(fontSize: MainDimens.textSize14),
          //   margin: EdgeInsets.only(
          //     top: 20.h,
          //     left: 58.w,
          //     right: 58.w,
          //   ),
          // ),

          // Visibility(
          //   visible: buttonVisibility,
          //   child: ButtonCustomWidget(
          //     width: 250.w,
          //     text: onPressed != null
          //         ? textButton ?? LocaleKeys.btn_try_again.tr
          //         : LocaleKeys.btn_close_page.tr,
          //     margin: EdgeInsets.only(top: 30.h),
          //     onPressed: onPressed ?? () => Get.back(),
          //   ),
          // ),
          3.h.height,
          AppButtonWidget(
            onTap: onPressed ?? () => Get.back(),
            text: onPressed != null ? textButton ?? "Try again" : "Close Page",
            color: primaryColor,
            textStyle: boldTextStyle(color: Colors.white),
            width: Get.width,
            enableScaleAnimation: false,
            shapeBorder: RoundedRectangleBorder(
                borderRadius: radius(defaultButtonRadius)),
          )
        ],
      ),
    );
  }
}
