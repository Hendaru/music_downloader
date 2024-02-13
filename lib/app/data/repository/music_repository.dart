import 'package:music_download_youtube/app/core/modules/dio_modules.dart';
import 'package:music_download_youtube/app/core/utils/event_manager.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_url_video_model/res_url_video_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_version_download_model/res_version_download_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_version_model/res_version_model.dart';

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

  EventManager getUrlRepository(String id, int tag) {
    return NetworkOnlyResource<ResUrlVideoModel, ResUrlVideoModel>(
      createCall: () => _service.getUrlService(id, tag),
      handleCallResult: (item) => Future.value(item),
    );
  }

  EventManager getUrlNewRepository(String id, String type) {
    return NetworkOnlyResource<ResUrlVideoModel, ResUrlVideoModel>(
      createCall: () => _service.getUrlNewService(id, type),
      handleCallResult: (item) => Future.value(item),
    );
  }

  EventManager getVersionRepository() {
    return NetworkOnlyResource<ResVersionModel, ResVersionModel>(
      createCall: () => _service.getVersionService(),
      handleCallResult: (item) => Future.value(item),
    );
  }

  EventManager getVersionDownloadRepository() {
    return NetworkOnlyResource<ResVersionDownloadModel,
        ResVersionDownloadModel>(
      createCall: () => _service.getVersionDownloadService(),
      handleCallResult: (item) => Future.value(item),
    );
  }
}
