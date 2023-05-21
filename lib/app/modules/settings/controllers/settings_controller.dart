import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  final InAppReview _inAppReview = InAppReview.instance;
  Availability availability = Availability.loading;

  // late BannerAd? ad;
  final bannerReady = false.obs;
  final vesion = "".obs;

  @override
  void onInit() {
    initAppReview();
    init();
    super.onInit();
  }

  @override
  void onClose() {
    // ad?.dispose();
    super.onClose();
  }

  Future<void> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionInfo = packageInfo.version;
    vesion.value = versionInfo;
  }

  // void initAds() {
  //   ad = BannerAd(
  //     adUnitId: getBannerAdUnitId()!,
  //     size: AdSize.mediumRectangle,
  //     request: const AdRequest(),
  //     listener: BannerAdListener(
  //       onAdLoaded: ((add) {
  //         bannerReady.value = true;
  //         // ad = add as BannerAd;
  //       }),
  //       onAdFailedToLoad: (ad, error) {
  //         bannerReady.value = false;
  //         ad.dispose();
  //       },
  //     ),
  //   );
  //   ad?.load();
  // }

  initAppReview() {
    (<T>(T? o) => o!)(WidgetsBinding.instance).addPostFrameCallback((_) async {
      try {
        final isAvailable = await _inAppReview.isAvailable();

        availability = isAvailable && !Platform.isAndroid
            ? Availability.available
            : Availability.unavailable;
      } catch (_) {
        availability = Availability.unavailable;
      }
    });
  }

  Future<void> requestReview() => _inAppReview.requestReview();

  Future<void> openStoreListing() => _inAppReview.openStoreListing(
        appStoreId: appStoreId,
        microsoftStoreId: microsoftStoreId,
      );

  Future<void> openEmail() async {
    String email = Uri.encodeComponent("hendarutiga@gmail.com");
    String subject = Uri.encodeComponent("Video Mp3 Downloader Feedback");
    String body = Uri.encodeComponent("");
    Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
    if (await launchUrl(mail)) {
      //email app opened
    } else {
      //email app is not opened
    }
  }
}
