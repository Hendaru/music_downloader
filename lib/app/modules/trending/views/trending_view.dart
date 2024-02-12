import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/routes/app_pages.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/network_utils.dart';
import 'package:music_download_youtube/app/utils/widgets/shimmer/skeleton_widget.dart';
import 'package:music_download_youtube/r.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:path/path.dart' as path;

import '../controllers/trending_controller.dart';

class TrendingView extends GetView<TrendingController> {
  const TrendingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(() => CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: const SizedBox(),
                excludeHeaderSemantics: true,
                expandedHeight: 17.h,
                pinned: false,
                stretch: true,
                floating: true,
                backgroundColor: Theme.of(context).colorScheme.onBackground,
                snap: true,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [
                      StretchMode.zoomBackground,
                    ],
                    collapseMode: CollapseMode.parallax,
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RawAutocomplete(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            return controller
                                .autoCompleteSuggestions(textEditingValue.text);
                          },
                          fieldViewBuilder: (context, textEditingController,
                              focusNode, onFieldSubmitted) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Find Your Favorite",
                                    style: extraBoldTextStyle(size: 18.sp)),
                                2.h.height,
                                TextField(
                                  decoration: inputDecoration(context,
                                      hintText: "Search all of videos",
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: primaryColor,
                                      ),
                                      suffixIcon: Obx(() =>
                                          controller.clearText.value == true
                                              ? Icon(
                                                  Icons.close,
                                                  color: primaryColor,
                                                ).onTap(() {
                                                  controller.videosTemporary
                                                          .value =
                                                      controller.videosTrending;

                                                  controller.clearText.value =
                                                      false;
                                                  textEditingController.clear();

                                                  hideKeyboard();
                                                })
                                              : SizedBox()),
                                      fillColor: Theme.of(context)
                                          .colorScheme
                                          .onTertiary,
                                      borderColor: whiteColor),
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  keyboardType: TextInputType.text,
                                  style: boldTextStyle(color: primaryColor),
                                  onSubmitted: (String value) {
                                    controller.searchResult(value);
                                  },
                                ),
                              ],
                            ).marginOnly(top: 3.h);
                          },
                          optionsViewBuilder: (context, onSelected, options) {
                            return Align(
                              alignment: Alignment.topLeft,
                              child: Material(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.w)),
                                child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxHeight: 50.h, maxWidth: 90.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: options.map((e) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e,
                                              style: boldTextStyle(),
                                            ),
                                            Divider(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                              thickness: 0.5,
                                            )
                                          ],
                                        )
                                            .paddingSymmetric(
                                                vertical: 1.h, horizontal: 4.w)
                                            .onTap(() {
                                          onSelected(e);
                                        });
                                      }).toList(),
                                    ).withScroll(
                                        reverse: false,
                                        physics: BouncingScrollPhysics())),
                              ),
                            );
                          },
                          onSelected: (option) {
                            if (option.isNotEmpty) {
                              controller.searchResult(option);
                            } else {
                              controller.videosTemporary.value =
                                  controller.videosTrending;

                              controller.clearText.value = false;
                            }
                          },
                        ),
                      ],
                    )),
              ),
              SliverToBoxAdapter(
                child: controller.loadingTreading.value
                    ? Center(
                        child: Column(
                        children: [
                          1.h.height,
                          SkeletonWidget(height: 8.h, width: 100.w),
                          2.h.height,
                          SkeletonWidget(height: 8.h, width: 100.w),
                          2.h.height,
                          SkeletonWidget(height: 8.h, width: 100.w),
                          2.h.height,
                          SkeletonWidget(height: 8.h, width: 100.w),
                          2.h.height,
                          SkeletonWidget(height: 8.h, width: 100.w),
                          2.h.height,
                          SkeletonWidget(height: 8.h, width: 100.w),
                          2.h.height,
                        ],
                      )).withHeight(90.h)
                    : Obx(() => controller.videosTemporary.isEmpty
                        ? Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                MainAssets.empty_sound3,
                                width: 15.w,
                                height: 15.w,
                              ),
                              2.h.height,
                              Text("No Data Found", style: boldTextStyle())
                            ],
                          )).withHeight(90.h)
                        : Column(
                            children: controller.videosTemporary
                                .map(
                                  (e) => Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      commonCacheImageWidget(
                                              e.thumbnails?[0].url.validate(),
                                              width: 30.w,
                                              // idcacheKey: element.idPlayList.validate(),
                                              fit: BoxFit.cover,
                                              isSquere: false)
                                          .cornerRadiusWithClipRRect(3.w),
                                      3.w.width,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.title.validate(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: boldTextStyle(),
                                          ),
                                          0.5.h.height,
                                          Text(
                                            e.duration.validate(),
                                            style: secondaryTextStyle(),
                                          ),
                                        ],
                                      ).expand(),
                                      // SvgPicture.asset(
                                      //         MainAssets.ic_more_more,
                                      //         width: 4.w,
                                      //         height: 4.w,
                                      //         // ignore: unrelated_type_equality_checks
                                      //         color: greyColor)
                                      //     .withWidth(10.w)
                                    ],
                                  ).onTap(() async {
                                    if (await isNetworkAvailable()) {
                                      Get.toNamed(
                                        Routes.DETAIL_VIDEO,
                                        arguments: {
                                          "video": e,
                                        },
                                      );
                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        openAdShowReward();
                                      });
                                    } else {
                                      toast("Not internet connection");
                                    }
                                  }).marginOnly(bottom: 1.h),
                                )
                                .toList(),
                          ).withScroll(
                            physics: BouncingScrollPhysics(),
                            reverse: false,
                            padding: EdgeInsets.symmetric(vertical: 1.h))),
              )
            ],
          ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal)),
    ));
  }
}
