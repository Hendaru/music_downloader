import 'package:get/get.dart';
import 'package:music_download_youtube/app/data/models/response/res_downloaded_model/res_downloaded_model.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';

class DownloadedController extends GetxController {
  final newlistDownloaded = <ResDownloadedModel>[].obs;
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    var listDownloaded = getDownloadedListFromSharePref();
    // int indexMusic = listMusic.indexWhere(((e) => e.id == idMusic));
    newlistDownloaded.value = listDownloaded;
  }
}
