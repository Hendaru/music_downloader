import 'package:get/get.dart';
import 'package:music_download_youtube/app/modules/home/bindings/home_binding.dart';
import 'package:music_download_youtube/app/modules/like/bindings/like_binding.dart';
import 'package:music_download_youtube/app/modules/playList/bindings/play_list_binding.dart';
import 'package:music_download_youtube/app/modules/settings/bindings/settings_binding.dart';
import 'package:music_download_youtube/app/utils/widgets/add_like_playlist/add_like_playlist_controller.dart';

import '../controllers/dasboard_controller.dart';

class DasboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DasboardController>(
      () => DasboardController(),
    );

    HomeBinding().dependencies();
    PlayListBinding().dependencies();
    LikeBinding().dependencies();
    SettingsBinding().dependencies();

    Get.lazyPut<AddLikePlaylistController>(() => AddLikePlaylistController());
  }
}
