import 'package:get/get.dart';

import '../controllers/list_all_music_controller.dart';

class ListAllMusicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAllMusicController>(
      () => ListAllMusicController(),
    );
  }
}
