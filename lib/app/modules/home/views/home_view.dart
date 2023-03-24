import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:music_download_youtube/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:music_download_youtube/app/modules/home/views/list_all_music_view.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_button.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_decoration.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/extensions/app_text_field.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/network_utils.dart';
import 'package:music_download_youtube/app/utils/widgets/item_music_widget/view/item_music_widget.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // List<ResMusicDataModel> listMusicHome = controller.listMusicHomeNew;
    // listMusicHome.shuffle();

    return Scaffold(
      body: SafeArea(child: const HomeMusicList()),
    );
  }
}

class HomeMusicList extends GetView<HomeController> {
  const HomeMusicList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    controller.getMusicList();
    controller.getPlaylist();
    controller.initAds();
    DasboardController controllerDasboard = Get.put(DasboardController());

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          2.h.height,
          Text(
            'Youtube Mp3 Downloader',
            style: boldTextStyle(size: 15.sp),
          ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
          2.h.height,
          Row(
            children: [
              AppTextField(
                controller: controller.downloadYoutube,
                autoFocus: false,
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.name,
                decoration: inputDecoration(
                  context,
                  hintText: "Youtube link",
                ),
              ).expand(),
              2.w.width,
              Obx(() => AppButtonWidget(
                    onTap: () {
                      if (controller.downloadYoutube.text.isNotEmpty) {
                        if (controller.progreesDouble.value != null) {
                          toast('Please finish the download first');
                        } else {
                          String? videoId =
                              convertUrlToId(controller.downloadYoutube.text);

                          if (videoId.isEmptyOrNull) {
                            toast('Url youtube not valid');
                          } else {
                            controller
                                .getVideoUrlController(videoId.validate());
                          }
                        }
                      } else {
                        toast('Please insert url youtube');
                      }
                    },
                    text: controller.progreesDouble.value != null
                        ? "${controller.progrees.value}%"
                        : "Download",
                    color: const Color(0xFF1F2633),
                    textStyle: boldTextStyle(color: Colors.white),
                    width: 30.w,
                    enableScaleAnimation: false,
                    // loadingColor: primaryColor,
                    loading: controller.loadingBtn.value,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: radius(defaultRadius)),
                  ))
            ],
          ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
          2.h.height,
          Obx(() => controller.progreesDouble.value != null
              ? LinearProgressIndicator(
                  value: controller.progreesDouble.value,

                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).progressIndicatorTheme.color!),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  // backgroundColor:
                  //     Platform.isAndroid ? Colors.transparent : null,
                ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal)
              : const SizedBox()),
          2.h.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Playlist',
                style: boldTextStyle(weight: FontWeight.bold, size: 15.sp),
              ),
              Obx(() => SvgPicture.asset(MainAssets.ic_plus2,
                          width: 7.w,
                          height: 7.w,
                          // ignore: unrelated_type_equality_checks
                          color: greyColor)
                      .onTap(() {
                    controller.addPlaylist(context);
                  },
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor:
                              Colors.transparent).visible(
                          controller.playlist.isNotEmpty)),
            ],
          ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
          2.h.height,
          Obx(() => Row(
                children: [
                  controller.playlist.isEmpty
                      ? Container(
                          decoration: boxDecorationWithRoundedCornersWidget(
                              borderRadius: radius(3.w),
                              backgroundColor:
                                  Theme.of(context).colorScheme.background),
                          width: 30.w,
                          height: 20.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                MainAssets.ic_plus2,
                                width: 8.w,
                                height: 8.w,
                                color: Theme.of(context).iconTheme.color,
                                // ignore: unrelated_type_equality_checks
                              ),
                              1.h.height,
                              Text(
                                'Add Playlist',
                                style: boldTextStyle(size: 10.sp),
                              )
                            ],
                          ),
                        )
                          .paddingOnly(left: defaultPaddingHorizontalGlobal)
                          .onTap(() {
                          controller.addPlaylist(context);
                        },
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent)
                      : const SizedBox(),
                  2.w.width,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultPaddingHorizontalGlobal),
                    child: Row(
                        children: controller.playlist.map((element) {
                      return Container(
                        width: 40.w,
                        padding: EdgeInsets.only(right: 3.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonCacheImageWidget(
                                    element.image.validate().isNotEmpty
                                        ? element.image.validate()
                                        : "",
                                    width: 40.w,
                                    idcacheKey: element.idPlayList.validate(),
                                    fit: BoxFit.cover,
                                    isSquere: true)
                                .cornerRadiusWithClipRRect(3.w),
                            1.h.height,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  element.namePlayList.validate(),
                                  overflow: TextOverflow.ellipsis,
                                  style: boldTextStyle(),
                                ),
                                1.h.height,
                                Text(
                                  'Playlist',
                                  style: secondaryTextStyle(),
                                )
                              ],
                            ).paddingOnly(right: 1.w),
                          ],
                        ),
                      ).onTap(() {
                        var listMusic = getMusicListFromSharePref();
                        var listMusicPlaylist = listMusic
                            .where((e) => e.idPlayList == element.idPlayList)
                            .toList();

                        if (listMusicPlaylist.isEmpty) {
                          toast("Playlist is empty");
                        } else {
                          controllerDasboard.initPlaylist(
                            // listSound: listMusicPlaylist,
                            id: element.idPlayList,
                            statusPlay: StatusToPlay.PLAYLIST,
                          );
                        }
                      },
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent);
                    }).toList()),
                  ).expand(),
                ],
              )),
          Obx(() => controller.bannerReady.value
              ? SizedBox(
                  width: controller.ad?.size.width.toDouble(),
                  height: controller.ad?.size.height.toDouble(),
                  child: AdWidget(ad: controller.ad!),
                ).paddingSymmetric(vertical: 2.h).center()
              : const SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recently download',
                style: boldTextStyle(weight: FontWeight.bold, size: 15.sp),
              ),
              Text(
                'all',
                style: secondaryTextStyle(size: 12.sp),
              ).onTap(() {
                Get.to(const ListAllMusicView());
              }),
            ],
          ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
          2.h.height,
          Obx(() => Column(
                children: controller.listMusicHomeNew.asMap().entries.map((e) {
                  // var index = e.key;

                  return ItemMusicWidget(
                    key: ValueKey<String>(e.value.id.validate()),
                    // key: Key(e.id.validate()),
                    itemMusic: e.value,
                    onTapMore: () {
                      controller.tabToMore(context, e.value);
                    },
                    isPlay: controllerDasboard.currentSongIdNotifier.value ==
                        e.value.id,
                    onTapPlay: () async {
                      if (await isNetworkAvailable() ||
                          !e.value.localLagu.isEmptyOrNull) {
                        setValue("idPlayNow", "");

                        controllerDasboard.initPlaylist(
                            // listSound: [e.value],
                            id: e.value.id,
                            statusPlay: StatusToPlay.SINGLE);

                        Future.delayed(const Duration(seconds: 5), () {
                          openAdShowReward();
                        });
                      } else {
                        toast("Not internet connection");
                      }
                    },
                  );
                }).toList(),
              )).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal)
        ],
      ),
    );
  }
}
