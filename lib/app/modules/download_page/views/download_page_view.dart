import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/utils/app_button.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_decoration.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/app_text_field.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

import '../controllers/download_page_controller.dart';

class DownloadPageView extends GetView<DownloadPageController> {
  const DownloadPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Youtube Mp3 Downloader',
            style: boldTextStyle(size: 15.sp),
          ),
          5.h.height,
          Column(
            children: [
              AppTextField(
                controller: controller.downloadYoutube,
                autoFocus: false,
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.name,
                enabled: true,
                decoration: inputDecoration(
                  context,
                  hintText: "Youtube link",
                  // prefixIcon: SvgPicture.asset(
                  //   MainAssets.ic_download2,
                  //   width: 1.w,
                  //   height: 1.w,
                  // ),
                ),
                suffix: SvgPicture.asset(
                  MainAssets.ic_close,
                  width: 5.w,
                  height: 5.w,
                ).onTap(() {
                  controller.downloadYoutube.clear();
                }),
              ),
              3.h.height,
              Obx(() => AppButtonWidget(
                    onTap: () {
                      if (controller.downloadYoutube.text.isNotEmpty) {
                        if (controller.progreesDouble.value != null) {
                          toast('Please finish the download first');
                        } else {
                          String? videoId =
                              convertUrlToId(controller.downloadYoutube.text);

                          if (videoId.isEmptyOrNull) {
                            toast('Url youtube not valid');
                          } else {
                            controller
                                .getVideoUrlController(videoId.validate());
                          }
                        }
                      } else {
                        toast('Please insert url youtube');
                      }
                    },
                    text: controller.progreesDouble.value != null
                        ? "${controller.progrees.value}%"
                        : "Download",
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    textStyle: boldTextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                    width: 30.w,
                    enableScaleAnimation: false,
                    // loadingColor: primaryColor,
                    loading: controller.loadingBtn.value,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: radius(defaultRadius)),
                  ))
            ],
          ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
          2.h.height,
          Obx(() => controller.progreesDouble.value != null
              ? LinearProgressIndicator(
                  value: controller.progreesDouble.value,

                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).progressIndicatorTheme.color!),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  // backgroundColor:
                  //     Platform.isAndroid ? Colors.transparent : null,
                ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal)
              : const SizedBox()),
        ],
      ),
    );
  }
}
