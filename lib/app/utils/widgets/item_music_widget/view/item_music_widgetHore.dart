import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/widgets/item_music_widget/controllers/item_music_widget_controller.dart';
import 'package:music_download_youtube/r.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class ItemMusicWidgetHore extends GetView<ItemMusicWidgetController> {
  const ItemMusicWidgetHore(
      {Key? key,
      required this.itemMusic,
      this.onTapMore,
      this.onTapLike,
      this.onDelete,
      this.liked,
      this.isPlay,
      this.onDownload,
      this.trash,
      this.valueDownloaded,
      required this.onTapPlay})
      : super(key: key);

  final ResMusicDataModel itemMusic;
  final bool? liked;
  final bool? isPlay;
  final bool? trash;
  final double? valueDownloaded;

  final Function()? onTapMore;
  final Function()? onTapLike;
  final Function()? onDelete;
  final Function()? onDownload;
  final Function() onTapPlay;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Stack(
              children: [
                commonCacheImageWidget(
                        itemMusic.imageLagu.validate().isEmptyOrNull
                            ? ""
                            : "$baseUrl/${itemMusic.imageLagu.validate()}",
                        width: 20.w,
                        idcacheKey: itemMusic.id.validate(),
                        fit: BoxFit.cover,
                        isSquere: true)
                    .cornerRadiusWithClipRRect(3.w),
                Positioned.fill(
                  child: isPlay.validate()
                      ? Lottie.asset(MainAssets.sound_wave,
                          animate: true,
                          delegates: LottieDelegates(
                            values: [
                              ValueDelegate.color(
                                // keyPath order: ['layer name', 'group name', 'shape name']
                                const ['**', 'Shape Layer 1', '**'],
                                value: Colors.amber,
                              ),
                              ValueDelegate.color(
                                // keyPath order: ['layer name', 'group name', 'shape name']
                                const ['**', 'Shape Layer 2', '**'],
                                value: Colors.amber,
                              ),
                              ValueDelegate.color(
                                // keyPath order: ['layer name', 'group name', 'shape name']
                                const ['**', 'Shape Layer 3', '**'],
                                value: Colors.amber,
                              ),
                            ],
                          ),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              SizedBox(
                                child: Text(error.toString()),
                              ))
                      : const SizedBox(),
                ),
              ],
            ),
            2.w.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemMusic.judulLagu.validate(),
                  overflow: TextOverflow.ellipsis,
                  style: boldTextStyle(
                      color: isPlay.validate() ? Colors.amber : null),
                ),
                1.h.height,
                Text(
                  "Hore 6",
                  style: secondaryTextStyle(),
                ),
                1.h.height,
                Row(
                  children: [
                    SvgPicture.asset(MainAssets.ic_play,
                        width: 4.w,
                        height: 4.w,
                        // ignore: unrelated_type_equality_checks
                        color: greyColor),
                    1.w.width,
                    Text(
                      itemMusic.duration.validate(),
                      style: secondaryTextStyle(),
                    ),
                  ],
                ),
              ],
            ).expand(),
          ],
        )
            .onTap(onTapPlay,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent)
            .expand(),
        onDownload != null
            ? Stack(
                children: [
                  Positioned.fill(
                    child: Center(
                      child: SvgPicture.asset(
                          trash.validate()
                              ? MainAssets.ic_trash
                              : MainAssets.ic_download,
                          width: 5.w,
                          height: 5.w,

                          // ignore: unrelated_type_equality_checks
                          color: greyColor),
                    ),
                  ),
                  SizedBox(
                    height: 8.w,
                    width: 8.w,
                    child: CircularProgressIndicator(
                      value: valueDownloaded,
                      strokeWidth: 2,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.amber),
                      backgroundColor: Theme.of(context).colorScheme.background,
                      // backgroundColor:
                      //     Platform.isAndroid ? Colors.transparent : null,
                    ),
                  ),
                ],
              ).paddingOnly(right: 3.w).onTap(onDownload,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent)
            : const SizedBox(),

        // ignore: unnecessary_null_comparison
        onTapMore != null
            ? SizedBox(
                height: 6.h,
                width: 5.w,
                child: SvgPicture.asset(MainAssets.ic_more_more,
                    width: 4.w,
                    height: 4.w,
                    // ignore: unrelated_type_equality_checks
                    color: greyColor),
              ).paddingOnly(right: 3.w).onTap(onTapMore,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent)
            : const SizedBox(),

        onTapLike != null
            ? SizedBox(
                height: 6.h,
                width: 5.w,
                child: SvgPicture.asset(MainAssets.ic_like2,
                    width: 4.w,
                    height: 4.w,
                    // ignore: unrelated_type_equality_checks
                    color: liked.validate() ? Colors.amber : greyColor),
              ).paddingOnly(right: 3.w).onTap(onTapLike,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent)
            : const SizedBox(),

        onDelete != null
            ? SizedBox(
                height: 6.h,
                width: 5.w,
                child: SvgPicture.asset(MainAssets.ic_trash2,
                    width: 4.w,
                    height: 4.w,

                    // ignore: unrelated_type_equality_checks
                    color: greyColor),
              ).onTap(onDelete,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent)
            : const SizedBox(),
      ],
    ).marginOnly(bottom: 1.h);
  }
}

// class ItemMusicController extends GetxController {
//   final liked = false.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   void likedFunc(itemMusic) {
//     LikeController likeController = Get.find();
//     liked.value = likeController.liked(itemMusic);
//   }
// }
