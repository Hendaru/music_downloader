import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/modules/downloaded/views/audio_downloaded_view.dart';
import 'package:music_download_youtube/app/modules/downloaded/views/video_downloaded_view.dart';

import '../controllers/downloaded_controller.dart';

class DownloadedView extends GetView<DownloadedController> {
  const DownloadedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
        body: PageView(
      physics: BouncingScrollPhysics(),
      children: [VideoDownloadedView(), AudioDownloadedView()],
    ));
  }
}
