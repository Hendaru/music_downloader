import 'package:get/get.dart';

import '../controllers/detail_downloaded_video_controller.dart';

class DetailDownloadedVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDownloadedVideoController>(
      () => DetailDownloadedVideoController(),
    );
  }
}
