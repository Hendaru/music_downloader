import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/r.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:sizer/sizer.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // controller.initAds();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          2.h.height,
          Text(
            "Rating Us",
            style: boldTextStyle(),
          ).center().withSize(height: 4.h, width: 100.w).onTap(() {
            showDialog(
              context: context,
              barrierDismissible:
                  true, // set to false if you want to force a rating
              builder: (context) => RatingDialog(
                initialRating: 1.0,
                // your app's name?
                title: Text(
                  'Rate Us',
                  textAlign: TextAlign.center,
                  style: boldTextStyle(size: h2),
                ),
                // encourage your user to leave a high rating?
                message: Text(
                  'We hope this app is useful for you. if it does, would you please give us a 5 star and a nice review on Google play, it really helps!',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(),
                ),
                // your app's logo?
                image: SvgPicture.asset(
                  MainAssets.logo_music,
                  width: 40.w,
                  height: 40.w,
                  color: Theme.of(Get.context!).colorScheme.onSurface,
                  fit: BoxFit.contain,
                ),
                submitButtonText: 'Submit',
                commentHint: 'Comment here',
                onCancelled: () => print('cancelled'),
                onSubmitted: (response) {
                  if (response.rating < 3.0) {
                    // send their comments to your email or anywhere you wish
                    // ask the user to contact you instead of leaving a bad review
                    toast("Thanks for your feedback",
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    bool rating = getBoolAsync("rating");
                    if (rating) {
                      controller.openStoreListing();
                    } else {
                      controller
                          .requestReview()
                          .then((value) => setValue("rating", true));
                    }
                  }
                },
              ),
            );
          }),
          const Divider().marginSymmetric(vertical: 2.h),
          Text(
            "Feedback",
            style: boldTextStyle(),
          ).center().withSize(height: 4.h, width: 100.w).onTap(() async {
            controller.openEmail();
          }),
          Spacer(),
          Obx(() =>
              Text("v ${controller.vesion.value}", style: primaryTextStyle())),
          3.h.height,
        ],
      ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
    );
  }
}
