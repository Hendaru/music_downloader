import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:music_download_youtube/app/modules/home/controllers/home_controller.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/network_utils.dart';
import 'package:music_download_youtube/app/utils/widgets/app_bar_custom_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/item_music_widget/view/item_music_widget.dart';

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
      body: Center(
        child: Obx(() => Column(
                  children: controller.listMusicHome.asMap().entries.map((e) {
                    return ItemMusicWidget(
                      key: ValueKey<String>(e.value.id.validate()),
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
                ).withScroll(
                    reverse: false, physics: const BouncingScrollPhysics()))
            .paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
      ),
    );
  }
}
