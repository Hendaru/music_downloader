import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/data/models/response/res_playlist_model/res_playlist_model.dart';
import 'package:music_download_youtube/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:music_download_youtube/app/notifiers/play_button_notifier.dart';
import 'package:music_download_youtube/app/notifiers/repeat_button_notifier.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/network_utils.dart';
import 'package:music_download_youtube/app/utils/widgets/app_bar_custom_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/item_music_widget/view/item_music_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/running_text_widget.dart';
import 'package:music_download_youtube/r.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class PlayerViewDasboard extends GetView<DasboardController> {
  const PlayerViewDasboard(
      {Key? key,
      // this.listSound,
      this.id,
      this.playlistModel,
      this.statusPlay,
      this.title})
      : super(key: key);
  // final List<ResMusicDataModel>? listSound;
  final String? id;
  final ResPlaylistModel? playlistModel;
  final String? title;
  final StatusToPlay? statusPlay;

  @override
  Widget build(BuildContext context) {
    // listSound != null || idPlaylist != null
    //     ? controller.initPlaylist(listSound:listSound, idPlaylist)
    //     : null;
    controller.initPlaylist(
        // listSound: listSound,
        id: id,
        statusPlay: statusPlay);

    // controller.delayImage();

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: Dismissible(
          direction: DismissDirection.down,
          background: const ColoredBox(color: Colors.transparent),
          secondaryBackground: const ColoredBox(color: Colors.transparent),
          key: UniqueKey(),
          onDismissed: (direction) {
            controller.ad = null;
            Get.back();
          },
          child: Scaffold(
            appBar: AppBarCustomWidget(
              // ignore: prefer_null_aware_operators
              title: playlistModel != null
                  ? playlistModel?.namePlayList.validate()
                  // ignore: prefer_null_aware_operators
                  : title != null
                      ? title.validate()
                      : null,
              leading: Icon(Icons.expand_more_rounded,
                      color: Theme.of(context).iconTheme.color)
                  .onTap(() => Get.back(),
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent),
            ),
            body: PageView(
              dragStartBehavior: DragStartBehavior.start,
              scrollDirection: Axis.vertical,
              physics: controller.playlist.length >= 2
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              children: [
                Center(
                    child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      1.h.height,
                      commonCacheImageWidget(
                              controller.currentSongImageNotifier.value,
                              width: 90.w,
                              idcacheKey:
                                  controller.currentSongIdNotifier.value,
                              fit: BoxFit.cover,
                              isSquere: true)
                          .cornerRadiusWithClipRRect(3.w),
                      3.h.height,
                      MarqueeWidget(
                        direction: Axis.horizontal,
                        child: Text(
                            controller.currentSongTitleNotifier.value
                                .validate(),
                            style: boldTextStyle(size: 20.sp)),
                      )
                          .withSize(width: 100.w, height: 5.h)
                          .paddingOnly(left: 2.w),
                      2.h.height,
                      Text(
                        controller.currentSongDurationNotifier.value,
                        style: secondaryTextStyle(size: 15.sp),
                      ),
                      2.h.height,
                      ProgressBar(
                        progress: controller.progressNotifier.value.current,
                        buffered: controller.progressNotifier.value.buffered,
                        total: controller.progressNotifier.value.total,
                        onSeek: controller.seek,
                      ).expand(),
                      1.h.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          repeat(),
                          2.w.width,
                          IconButton(
                            icon: const Icon(Icons.skip_previous_rounded),
                            iconSize: 10.w,
                            onPressed: controller.isFirstSongNotifier.value
                                ? null
                                : controller.onPreviousSongButtonPressed,
                          ),
                          playBtn(context),
                          IconButton(
                            icon: const Icon(Icons.skip_next_rounded),
                            iconSize: 10.w,
                            onPressed: controller.isLastSongNotifier.value
                                ? null
                                : controller.onNextSongButtonPressed,
                          ),
                          2.w.width,
                          SvgPicture.asset(
                            MainAssets.shuffle,
                            width: 6.w,
                            height: 6.w,
                            color: controller.isShuffleModeEnabledNotifier.value
                                ? Theme.of(context).iconTheme.color
                                : greyColor,
                          ).onTap(controller.onShuffleButtonPressed)
                        ],
                      ),
                      controller.playlist.length >= 2
                          ? Column(
                              children: [
                                SizedBox(
                                    width: 30.w,
                                    child: const Divider(
                                      thickness: 4.0,
                                    )),
                                1.h.height,
                                Text(
                                  "Playlist",
                                  overflow: TextOverflow.ellipsis,
                                  style: boldTextStyle(),
                                ),
                                1.h.height,
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ).paddingSymmetric(
                      horizontal: defaultPaddingHorizontalGlobal),
                )),
              ],
            ),
          )),
    );
  }

  playBtn(BuildContext context) {
    switch (controller.playButtonNotifier.value) {
      case ButtonState.loading:
        return Stack(
          children: [
            Lottie.asset(MainAssets.loading_play,
                animate: true,
                width: 32.w,
                height: 32.w,
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
                size: 10.w,
              ),
            )),
          ],
        );

      case ButtonState.paused:
        return SizedBox(
          width: 32.w,
          height: 32.w,
          child: IconButton(
            icon: const Icon(Icons.play_circle_fill_rounded),
            iconSize: 20.w,
            onPressed: controller.play,
          ),
        );
      case ButtonState.playing:
        return SizedBox(
          width: 32.w,
          height: 32.w,
          child: IconButton(
            icon: const Icon(Icons.pause_circle_filled_rounded),
            iconSize: 20.w,
            onPressed: controller.pause,
          ),
        );
    }
  }

  repeat() {
    return ValueListenableBuilder<RepeatState>(
      valueListenable: controller.repeatButtonNotifier,
      builder: (context, value, child) {
        String icon;
        Color colorIcon;
        switch (value) {
          case RepeatState.off:
            icon = MainAssets.repeat;
            break;
          case RepeatState.repeatSong:
            icon = MainAssets.repeat_one;
            break;
          case RepeatState.repeatPlaylist:
            icon = MainAssets.repeat;
            break;
        }
        switch (value) {
          case RepeatState.off:
            colorIcon = greyColor;
            break;
          case RepeatState.repeatSong:
            colorIcon = Theme.of(context).iconTheme.color ?? whiteColor;
            break;
          case RepeatState.repeatPlaylist:
            colorIcon = Theme.of(context).iconTheme.color ?? whiteColor;
            break;
        }

        return SvgPicture.asset(icon, width: 6.w, height: 6.w, color: colorIcon)
            .onTap(controller.onRepeatButtonPressed);
      },
    );
  }
}
