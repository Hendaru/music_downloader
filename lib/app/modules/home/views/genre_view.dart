import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/modules/home/controllers/home_controller.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/widgets/app_bar_custom_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/item_music_widget/view/item_music_widget.dart';

class GenreView extends GetView<HomeController> {
  const GenreView({Key? key, this.idGenre, this.nameGenre}) : super(key: key);
  final String? idGenre;
  final String? nameGenre;
  @override
  Widget build(BuildContext context) {
    HomeController controllerHome = Get.put(HomeController());

    controllerHome.genreDetail(idGenre.validate());
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: nameGenre.validate(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding:
            EdgeInsets.symmetric(horizontal: defaultPaddingHorizontalGlobal),
        child: Obx(() => Column(
                children: controllerHome.musicGenre.map((e) {
              return ItemMusicWidget(
                itemMusic: e,
                onTapMore: () {},
                onTapPlay: () {},
              );
            }).toList())),
      ),
    );
  }
}
