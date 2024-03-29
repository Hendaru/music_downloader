import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/modules/dasboard/widgets/menu_dasboard.dart';
import 'package:music_download_youtube/app/notifiers/play_button_notifier.dart';
import 'package:music_download_youtube/app/notifiers/repeat_button_notifier.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/unity_ads.dart';
import 'package:music_download_youtube/app/utils/widgets/running_text_widget.dart';
import 'package:music_download_youtube/r.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../controllers/dasboard_controller.dart';

class DasboardView extends GetView<DasboardController> {
  const DasboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Get.isDarkMode ? Brightness.dark : Brightness.light,
        statusBarBrightness:
            Get.isDarkMode ? Brightness.dark : Brightness.light));

    UnityInitializerController controllerUnity =
        Get.put(UnityInitializerController());

    return Scaffold(
      bottomNavigationBar: Obx(() => SizedBox(
          height: 8.h,
          child: Row(
            children: [
              MenuDasboard(
                  pos: 0,
                  icon: MainAssets.ic_fire,
                  currentIndex: controller.currentIndex.value,
                  name: "Trending"),
              MenuDasboard(
                  pos: 1,
                  icon: MainAssets.ic_video_downloaded,
                  currentIndex: controller.currentIndex.value,
                  name: "Video"),
              MenuDasboard(
                  pos: 2,
                  icon: MainAssets.ic_audio_downloaded,
                  currentIndex: controller.currentIndex.value,
                  name: "Audio"),
              MenuDasboard(
                  pos: 3,
                  icon: MainAssets.ic_settings2,
                  currentIndex: controller.currentIndex.value,
                  name: "Setting"),
            ],
          ))),
      body: SafeArea(
        bottom: true,
        child: Obx(() => Column(
              children: [
                controller.widgets[controller.currentIndex.value].expand(),
                controller.progreesDouble.value != null
                    ? Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 100.w,
                        height: 8.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPaddingHorizontalGlobal),
                        child: Column(
                          children: [
                            LinearProgressIndicator(
                              value: controller.progreesDouble.value,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.amber),
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                            ),
                            1.h.height,
                            Row(
                              children: [
                                commonCacheImageWidget(
                                        controller.imageDownload.value,
                                        width: 12.w,
                                        idcacheKey: controller.idDownload.value,
                                        fit: BoxFit.cover,
                                        isSquere: true)
                                    .cornerRadiusWithClipRRect(10.w),
                                3.w.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.titleDownload.value,
                                      overflow: TextOverflow.ellipsis,
                                      style: boldTextStyle(),
                                    ),
                                    Text(
                                      "Downloading...",
                                      style: secondaryTextStyle(),
                                    ),
                                  ],
                                ).expand(),
                                Text(
                                  controller.downloadFrom.value
                                      ? "${controller.progreesVideo.value}%"
                                      : "${controller.progreesAudio.value}%",
                                  overflow: TextOverflow.ellipsis,
                                  style: boldTextStyle(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                !controller.songPlay.value
                    ? const SizedBox()
                    : Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 100.w,
                        height: 12.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            1.h.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                commonCacheImageWidget(
                                        controller
                                            .currentSongImageNotifier.value,
                                        width: 12.w,
                                        idcacheKey: controller
                                            .currentSongIdNotifier.value,
                                        fit: BoxFit.cover,
                                        isSquere: true)
                                    .cornerRadiusWithClipRRect(2.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MarqueeWidget(
                                      direction: Axis.horizontal,
                                      child: Text(
                                          controller
                                              .currentSongTitleNotifier.value
                                              .validate(),
                                          style: boldTextStyle()),
                                    )
                                        .withSize(width: 100.w, height: 2.5.h)
                                        .paddingOnly(left: 2.w),
                                    1.h.height,
                                    Text(
                                      controller
                                          .currentSongDurationNotifier.value
                                          .validate(),
                                      style: secondaryTextStyle(),
                                    ),
                                  ],
                                ).expand(),
                                playBtn(context),
                              ],
                            ),
                            1.h.height,
                            Expanded(
                                child: ProgressBar(
                                    progress: controller
                                        .progressNotifier.value.current,
                                    buffered: controller
                                        .progressNotifier.value.buffered,
                                    total:
                                        controller.progressNotifier.value.total,
                                    onSeek: controller.seek,
                                    thumbCanPaintOutsideBar: false,
                                    thumbRadius: 5.0,
                                    timeLabelLocation: TimeLabelLocation.none)),
                            // Obx(() => controllerUnity
                            //     .banner2(BannerSize.iabStandard)
                            //     .visible(controllerUnity
                            //         .bannerProgressDetailvisible.value)),
                          ],
                        ),
                      ).onTap(() {
                        controller.audioPlayer.playing
                            ? controller.audioPlayer.pause()
                            : controller.audioPlayer.play();

                        // if (controller.playButtonNotifier.value ==
                        //     ButtonState.loading) {
                        //   toast("Please wait...");
                        // } else {
                        //   Get.to(
                        //     const PlayerViewDasboard(),
                        //     opaque: false,
                        //   );
                        // }
                      }).paddingSymmetric(
                        horizontal: defaultPaddingHorizontalGlobal),
              ],
            )),
      ),
    );
  }

  playBtn(BuildContext context) {
    switch (controller.playButtonNotifier.value) {
      case ButtonState.loading:
        return Stack(
          children: [
            Lottie.asset(MainAssets.loading_play,
                animate: true,
                width: 15.w,
                height: 15.w,
                delegates: LottieDelegates(
                  values: [
                    ValueDelegate.color(
                      // keyPath order: ['layer name', 'group name', 'shape name']
                      const ['**', 'Layer 1 Outlines', '**'],
                      value: Theme.of(context).iconTheme.color,
                    ),
                    ValueDelegate.color(
                      // keyPath order: ['layer name', 'group name', 'shape name']
                      const ['**', 'Layer 3 Outlines', '**'],
                      value: Theme.of(context).iconTheme.color,
                    ),
                    ValueDelegate.color(
                      // keyPath order: ['layer name', 'group name', 'shape name']
                      const [
                        '**',
                        'Layer 3 Outlines 2',
                        '**',
                      ],
                      value: Theme.of(context).iconTheme.color,
                    ),
                  ],
                ),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => SizedBox(
                      child: Text(error.toString()),
                    )),
            Positioned.fill(
                child: Center(
              child: Icon(
                Icons.play_arrow_rounded,
                color: Theme.of(context).scaffoldBackgroundColor,
                size: 6.w,
              ),
            )),
          ],
        );
      case ButtonState.paused:
        return SizedBox(
          width: 15.w,
          height: 15.w,
          child: Icon(Icons.play_circle_fill_rounded, size: 10.w)
              .onTap(controller.play),
        );

      case ButtonState.playing:
        return SizedBox(
          width: 15.w,
          height: 15.w,
          child: Icon(Icons.pause_circle_filled_rounded, size: 10.w)
              .onTap(controller.pause),
        );
    }
  }

  repeat() {
    return ValueListenableBuilder<RepeatState>(
      valueListenable: controller.repeatButtonNotifier,
      builder: (context, value, child) {
        Icon icon;
        switch (value) {
          case RepeatState.off:
            icon = const Icon(Icons.repeat_on_rounded, color: Colors.grey);
            break;
          case RepeatState.repeatSong:
            icon = const Icon(Icons.repeat_one_on_rounded);
            break;
          case RepeatState.repeatPlaylist:
            icon = const Icon(Icons.repeat_on_rounded);
            break;
        }
        return IconButton(
          icon: icon,
          onPressed: controller.onRepeatButtonPressed,
        );
      },
    );
  }
}
