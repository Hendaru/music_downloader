import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/app_text_field.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

import '../controllers/trending_controller.dart';

class TrendingView extends GetView<TrendingController> {
  const TrendingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leading: const SizedBox(),
                  excludeHeaderSemantics: true,
                  expandedHeight: 10.h,
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
                        children: [
                          RawAutocomplete(
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              return controller.autoCompleteSuggestions(
                                  textEditingValue.text);
                            },
                            fieldViewBuilder: (context, textEditingController,
                                focusNode, onFieldSubmitted) {
                              return TextField(
                                decoration: inputDecoration(context,
                                    hintText: "Search Video",
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: primaryColor,
                                    ),
                                    suffixIcon: Obx(
                                        () => controller.clearText.value == true
                                            ? Icon(
                                                Icons.close,
                                                color: primaryColor,
                                              ).onTap(() {
                                                // controller.clearSearch(
                                                //     textEditingController);
                                                // controller
                                                //         .videosTemporary.value =
                                                //     controller.videosTrending;
                                                print(
                                                    "----------hore1------------");
                                                print(controller
                                                    .videosTrending.length);
                                                controller
                                                        .videosTemporary.value =
                                                    controller.videosTrending;

                                                controller.clearText.value =
                                                    false;
                                                textEditingController.clear();

                                                print(
                                                    "----------hore2------------");
                                                print(controller
                                                    .videosTrending[0].title);
                                                hideKeyboard();
                                              })
                                            : SizedBox()),
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                    borderColor: whiteColor),
                                controller: textEditingController,
                                focusNode: focusNode,
                                onSubmitted: (String value) {},
                              ).marginOnly(top: 3.h);
                            },
                            optionsViewBuilder: (context, onSelected, options) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  child: Container(
                                    width: 90.w,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: false,
                                      itemCount: options.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final option = options.elementAt(index);
                                        return ListTile(
                                          title: Text(option),
                                          onTap: () {
                                            onSelected(option);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                            onSelected: (option) =>
                                controller.searchResult(option),
                          ),
                        ],
                      )),
                ),
                SliverToBoxAdapter(
                  child: controller.loadingTreading.value
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.amber),
                            backgroundColor:
                                Platform.isAndroid ? Colors.transparent : null,
                          ),
                        ).withHeight(90.h)
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
                                      children: [
                                        commonCacheImageWidget(
                                                e.thumbnails?[0].url.validate(),
                                                width: 30.w,
                                                // idcacheKey: element.idPlayList.validate(),
                                                fit: BoxFit.cover,
                                                isSquere: false)
                                            .cornerRadiusWithClipRRect(3.w),
                                        3.w.width,
                                        Text(
                                          e.title.validate(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: boldTextStyle(),
                                        ).expand(),
                                        SvgPicture.asset(
                                                MainAssets.ic_more_more,
                                                width: 4.w,
                                                height: 4.w,
                                                // ignore: unrelated_type_equality_checks
                                                color: greyColor)
                                            .withWidth(10.w)
                                      ],
                                    ).marginOnly(bottom: 2.h),
                                  )
                                  .toList(),
                            ).withScroll(
                              physics: BouncingScrollPhysics(),
                              reverse: false,
                              padding: EdgeInsets.symmetric(vertical: 1.h))),
                )
              ],
            ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal)));
  }
}
