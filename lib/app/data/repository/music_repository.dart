import 'package:music_download_youtube/app/core/modules/dio_modules.dart';
import 'package:music_download_youtube/app/core/utils/event_manager.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_url_video_model/res_url_video_model.dart';

class MusicRepository {
  final _service = DioModule().musicService;

  EventManager getMusicRepository() {
    return NetworkOnlyResource<ResMusicModel, ResMusicModel>(
      createCall: () => _service.getMusicService(),
      handleCallResult: (item) => Future.value(item),
    );
  }

  EventManager getUrlVideoRepository(String id) {
    return NetworkOnlyResource<ResUrlVideoModel, ResUrlVideoModel>(
      createCall: () => _service.getUrlVideoService(id),
      handleCallResult: (item) => Future.value(item),
    );
  }
}
