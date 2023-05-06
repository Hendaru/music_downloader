import 'package:get/get.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:youtube_data_api/models/channel.dart';
import 'package:youtube_data_api/models/playlist.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtube_data_api/youtube_data_api.dart';

class TrendingController extends GetxController {
  YoutubeDataApi youtubeDataApi = YoutubeDataApi();

  List<Video> videos = [];
  List<Video> videosTrending = [];
  var loadingTreading = true.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    loadingTreading.value = true;
    videosTrending = await youtubeDataApi.fetchTrendingVideo();
    loadingTreading.value = false;
  }

  Future<void> search() async {
    String query = "Indonesia";
    // YoutubeDataApi youtubeDataApi = YoutubeDataApi();
    List videoResult =
        await youtubeDataApi.fetchSearchVideo(query, youtubeToken);
    videoResult.forEach((element) {
      if (element is Video) {
        Video video = element;
        videos.add(video);
      } else if (element is Channel) {
        Channel channel = element;
      } else if (element is PlayList) {
        PlayList playList = element;
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
