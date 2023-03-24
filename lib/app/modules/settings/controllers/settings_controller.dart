import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:music_download_youtube/app/utils/admob.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  final InAppReview _inAppReview = InAppReview.instance;
  Availability availability = Availability.loading;
  String _appStoreId = 'com.stress.killer';
  String _microsoftStoreId = 'com.stress.killer';

  late BannerAd? ad;
  final bannerReady = false.obs;

  @override
  void onInit() {
    initAppReview();
    super.onInit();
  }

  @override
  void onClose() {
    ad?.dispose();
    super.onClose();
  }

  void initAds() {
    ad = BannerAd(
      adUnitId: getBannerAdUnitId()!,
      size: AdSize.mediumRectangle,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: ((add) {
          bannerReady.value = true;
          // ad = add as BannerAd;
        }),
        onAdFailedToLoad: (ad, error) {
          bannerReady.value = false;
          ad.dispose();
        },
      ),
    );
    ad?.load();
  }

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

  // void _setAppStoreId(String id) => _appStoreId = id;

  // void _setMicrosoftStoreId(String id) => _microsoftStoreId = id;

  Future<void> requestReview() => _inAppReview.requestReview();

  Future<void> openStoreListing() => _inAppReview.openStoreListing(
        appStoreId: _appStoreId,
        microsoftStoreId: _microsoftStoreId,
      );

  Future<void> openEmail() async {
    String email = Uri.encodeComponent("hendarutiga@gmail.com");
    String subject = Uri.encodeComponent("Stress Killer Feedback");
    String body = Uri.encodeComponent("");
    Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
    if (await launchUrl(mail)) {
      //email app opened
    } else {
      //email app is not opened
    }
  }
}
