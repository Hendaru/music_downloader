// import 'dart:io';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:music_download_youtube/app/utils/app_constants.dart';

// InterstitialAd? interstitialAd;
// RewardedAd? rewardedAdAd;

// adShow() async {
//   if (interstitialAd == null) {
//     print('Warning: attempt to show interstitial before loaded.');
//     return;
//   }
//   interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//     onAdShowedFullScreenContent: (InterstitialAd ad) =>
//         print('ad onAdShowedFullScreenContent.'),
//     onAdDismissedFullScreenContent: (InterstitialAd ad) {
//       print('$ad onAdDismissedFullScreenContent.');
//       ad.dispose();

//       createInterstitialAd();
//     },
//     onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//       print('$ad onAdFailedToShowFullScreenContent: $error');
//       ad.dispose();
//       createInterstitialAd();
//     },
//   );

//   interstitialAd!.show();
// }

// adShowrewardedAd() async {
//   if (rewardedAdAd == null) {
//     print('Warning: attempt to show interstitial before loaded.');
//     return;
//   }
//   rewardedAdAd!.fullScreenContentCallback = FullScreenContentCallback(
//     onAdShowedFullScreenContent: (RewardedAd ad) =>
//         print('ad onAdShowedFullScreenContent.'),
//     onAdDismissedFullScreenContent: (RewardedAd ad) {
//       ad.dispose();

//       createRewardedAd();
//     },
//     onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
//       print('$ad onAdFailedToShowFullScreenContent: $error');
//       ad.dispose();
//       createRewardedAd();
//     },
//   );

//   rewardedAdAd!.setImmersiveMode(true);
//   rewardedAdAd!
//       .show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {});
//   rewardedAdAd = null;
// }

// void createInterstitialAd() {
//   InterstitialAd.load(
//       adUnitId: getInterstitialAdUnitId()!,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           // print("---------------loaded-----------------");
//           // print('$ad loaded');
//           interstitialAd = ad;
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           // print('InterstitialAd failed to load: $error.');
//           interstitialAd = null;
//         },
//       ));
// }

// void createRewardedAd() {
//   RewardedAd.load(
//       adUnitId: rewardedAdUniId()!,
//       request: const AdRequest(),
//       rewardedAdLoadCallback: RewardedAdLoadCallback(
//         onAdLoaded: (RewardedAd ad) {
//           // print("---------------loaded rewardedAdAd-----------------");
//           // print('$ad loaded');
//           rewardedAdAd = ad;
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           // print('InterstitialAd failed to load: $error.');
//           rewardedAdAd = null;
//         },
//       ));
// }

// // Widget showBannerAds({required AdSize adSize}) {
// //   return Center(
// //     child: SizedBox(
// //       height: adSize.height.toDouble(),
// //       width: adSize.width.toDouble(),
// //       child: AdWidget(
// //         ad: BannerAd(
// //           adUnitId: getBannerAdUnitId()!,
// //           size: adSize,
// //           request: const AdRequest(),
// //           listener: BannerAdListener(
// //             onAdLoaded: ((ad) {}),
// //             onAdFailedToLoad: (ad, error) {},
// //           ),
// //         )..load(),
// //       ),
// //     ),
// //   );
// // }

// String? getBannerAdUnitId() {
//   if (Platform.isAndroid) {
//     return admobBanner;
//   } else {
//     return admobBanner;
//   }
// }

// String? getInterstitialAdUnitId() {
//   if (Platform.isAndroid) {
//     return admobInterstitial;
//   } else {
//     return admobInterstitial;
//   }
// }

// String? rewardedAdUniId() {
//   if (Platform.isAndroid) {
//     return admobRewarded;
//   } else {
//     return admobRewarded;
//   }
// }
