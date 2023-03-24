import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/r.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      backgroundColor: greyBgLightColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset(
            //   MainAssets.logo_music,
            //   width: 60.w,
            //   color: Theme.of(context).colorScheme.onSurface,
            // ),
            Lottie.asset(
              MainAssets.loading,
              animate: true,
              fit: BoxFit.cover,
              width: 50.w,
              errorBuilder: (context, error, stackTrace) => SizedBox(
                child: Text(error.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
