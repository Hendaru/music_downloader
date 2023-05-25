import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class UnityInitializerController extends GetxController {
  Map<String, bool> placements = {
    AdManager.interstitialVideoAdPlacementId: false,
    AdManager.rewardedVideoAdPlacementId: false,
  };

  final bannerDetailVideovisible = true.obs;
  // final bannervisible2 = true.obs;
  final bannerProgressDetailvisible = true.obs;

  Future<void> init() async {
    await UnityAds.init(
        gameId: AdManager.gameId,
        testMode: true,
        onComplete: () => _loadAds(),
        onFailed: (error, message) {
          bannerDetailVideovisible.value = false;
          print('Initialization Failed: $error $message');
        });
  }

  void _loadAds() {
    bannerDetailVideovisible.value = true;

    for (var placementId in placements.keys) {
      _loadAd(placementId);
    }
  }

  void _loadAd(String placementId) {
    UnityAds.load(
      placementId: placementId,
      onComplete: (placementId) {
        placements[placementId] = true;
      },
      onFailed: (placementId, error, message) =>
          print('Load Failed $placementId: $error $message'),
    );
  }

  Widget banner(BannerSize size) {
    return UnityBannerAd(
        placementId: AdManager.bannerAdPlacementId,
        size: size,
        onLoad: (placementId) {
          print('Banner loaded: $placementId');
          bannerDetailVideovisible.value = true;
        },
        onClick: (placementId) => print('Banner clicked: $placementId'),
        onFailed: (placementId, error, message) {
          bannerDetailVideovisible.value = false;
          print('Banner Ad $placementId failed: $error $message');
        }).paddingOnly(top: 2.h);
  }

  Widget banner2(BannerSize size) {
    return UnityBannerAd(
        placementId: AdManager.bannerAdPlacementId,
        size: size,
        onLoad: (placementId) {
          print('Banner loaded: $placementId');
          bannerProgressDetailvisible.value = true;
        },
        onClick: (placementId) => print('Banner clicked: $placementId'),
        onFailed: (placementId, error, message) {
          bannerProgressDetailvisible.value = false;
          print('Banner Ad $placementId failed: $error $message');
        }).paddingOnly(top: 2.h);
  }

  void showAd(String placementId) {
    placements[placementId] = false;

    UnityAds.showVideoAd(
        placementId: placementId,
        onComplete: (placementId) {
          print('Video Ad $placementId completed');
          _loadAd(placementId);
        },
        onFailed: (placementId, error, message) {
          print('Video Ad $placementId failed: $error $message');
          _loadAd(placementId);
        },
        onStart: (placementId) => print('Video Ad $placementId started'),
        onClick: (placementId) => print('Video Ad $placementId click'),
        onSkipped: (placementId) {
          print('Video Ad $placementId skipped');
          _loadAd(placementId);
        });
  }
}

class AdManager {
  static String get gameId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return '5284807';
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return '5284806';
    }
    return '';
  }

  static String get bannerAdPlacementId {
    return 'Banner_Android';
  }

  static String get interstitialVideoAdPlacementId {
    return 'Interstitial_Android';
  }

  static String get rewardedVideoAdPlacementId {
    return 'Rewarded_Android';
  }
}
