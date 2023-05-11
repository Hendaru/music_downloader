import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:music_download_youtube/app/modules/home/controllers/home_controller.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/extensions/app_text_field.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/network_utils.dart';
import 'package:music_download_youtube/app/utils/widgets/app_bar_custom_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/item_music_widget/view/item_music_widget.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

class ListAllMusicView extends GetView<HomeController> {
  const ListAllMusicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DasboardController controllerDasboard = Get.put(DasboardController());

    return Scaffold(
      appBar: const AppBarCustomWidget(
        title: "List all music",
        centerTitle: true,
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
              leading: const SizedBox(),
              excludeHeaderSemantics: true,
              expandedHeight: 11.h,
              pinned: false,
              stretch: true,
              floating: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              snap: true,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground,
                ],
                collapseMode: CollapseMode.parallax,
                background: Obx(() => AppTextField(
                      controller: controller.searchYoutube,
                      autoFocus: false,
                      textFieldType: TextFieldType.NAME,
                      keyboardType: TextInputType.name,
                      enabled: true,
                      decoration: inputDecoration(
                        context,
                        hintText: "Search Music",
                        // prefixIcon: SvgPicture.asset(
                        //   MainAssets.ic_download2,
                        //   width: 1.w,
                        //   height: 1.w,
                        // ),
                      ),
                      onChanged: (e) {
                        controller.searchMusic(e);
                      },
                      suffix: controller.clearSearchBtn.value
                          ? SvgPicture.asset(
                              MainAssets.ic_close,
                              width: 5.w,
                              height: 5.w,
                            ).onTap(() {
                              controller.searchYoutube.clear();
                              controller.listMusicHomeSearch.value =
                                  controller.listMusicHome;
                              controller.clearSearchBtn.value = false;
                              hideKeyboard();
                            })
                          : null,
                    ).paddingSymmetric(
                        horizontal: defaultPaddingHorizontalGlobal)),
              ),
            ),
            SliverToBoxAdapter(
              child: Obx(() => Column(
                    children:
                        controller.listMusicHomeSearch.asMap().entries.map((e) {
                      return ItemMusicWidget(
                        key: ValueKey<String>(e.value.id.validate()),
                        itemMusic: e.value,
                        onTapMore: () {
                          controller.tabToMore(context, e.value);
                        },
                        isPlay:
                            controllerDasboard.currentSongIdNotifier.value ==
                                e.value.id,
                        onTapPlay: () async {
                          if (await isNetworkAvailable() ||
                              !e.value.localLagu.isEmptyOrNull) {
                            setValue("idPlayNow", "");

                            controllerDasboard.initPlaylist(
                                // listSound: [e.value],
                                id: e.value.id,
                                statusPlay: StatusToPlay.SINGLE);

                            // Future.delayed(const Duration(seconds: 5), () {
                            //   openAdShowReward();
                            // });
                          } else {
                            toast("Not internet connection");
                          }
                        },
                      );
                    }).toList(),
                  ).withScroll(
                      reverse: false,
                      physics: const BouncingScrollPhysics())).paddingSymmetric(
                  horizontal: defaultPaddingHorizontalGlobal),
            ),
          ],
        ),
      ),
    );
  }
}
