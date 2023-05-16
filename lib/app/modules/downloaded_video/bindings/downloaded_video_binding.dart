import 'package:get/get.dart';

import '../controllers/downloaded_video_controller.dart';

class DownloadedVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadedVideoController>(
      () => DownloadedVideoController(),
    );
  }
}
