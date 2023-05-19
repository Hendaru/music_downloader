import 'package:get/get.dart';
import 'package:music_download_youtube/app/data/models/response/res_downloaded_model/res_downloaded_model.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';

class DownloadedAudioController extends GetxController {
  final newlistAudioDownloaded = <ResDownloadedModel>[].obs;
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    var listDownloaded = getDownloadedListFromSharePref();
    newlistAudioDownloaded.value = listDownloaded
        .where((element) => element.id!.contains("audio"))
        .toList();
  }
}
