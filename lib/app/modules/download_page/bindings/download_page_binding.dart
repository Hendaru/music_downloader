import 'package:get/get.dart';

import '../controllers/download_page_controller.dart';

class DownloadPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadPageController>(
      () => DownloadPageController(),
    );
  }
}
