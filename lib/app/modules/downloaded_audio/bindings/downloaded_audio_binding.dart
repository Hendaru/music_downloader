import 'package:get/get.dart';

import '../controllers/downloaded_audio_controller.dart';

class DownloadedAudioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadedAudioController>(
      () => DownloadedAudioController(),
    );
  }
}
