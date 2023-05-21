import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:music_download_youtube/app/theme/app_theme.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_download_youtube/app/utils/unity_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';

late SharedPreferences sharedPreferences;
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.video.music.downloader',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );

  // MobileAds.instance.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  UnityInitializerController controllerUnity =
      Get.put(UnityInitializerController());
  controllerUnity.init();
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: "Video Mp3 Downloader",
        initialRoute: AppPages.INITIAL,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        defaultTransition: Transition.noTransition,
        transitionDuration: const Duration(milliseconds: 100),
      );
    }),
  );
}
