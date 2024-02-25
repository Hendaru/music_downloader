import 'package:music_download_youtube/app/core/modules/dio_modules.dart';
import 'package:music_download_youtube/app/core/utils/event_manager.dart';
import 'package:music_download_youtube/app/data/models/response/error/res_error.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_search_model/res_search_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_url_video_model/res_url_video_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_version_download_model/res_version_download_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_version_model/res_version_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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

  Future<Either<Failure, ResUrlVideoModel>> getUrlNew2Repository(
      String id, String type) async {
    try {
      final result = await _service.getUrlNewService(id, type);

      if (result.data == null) {
        return left(Failure(
          status: 401,
          message: "Video error",
        ));
      }

      return right(result);
    } on DioError catch (e) {
      final code = e.response?.statusCode;
      final msg = e.response?.statusMessage;

      return left(Failure(
        status: code,
        message: msg,
      ));
    }
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

  Future<Either<Failure, List<ResSearchItemModel>>> getVideolistRealRepository({
    required String part,
    required String maxResults,
    required String query,
    required String key,
    required String regionCode,
    required String type,
  }) async {
    try {
      final result = await _service.getVideolistRealService(
        part,
        maxResults,
        query,
        key,
        regionCode,
        type,
      );

      if (result.items.isEmpty) {
        return left(Failure(
          status: 401,
          message: "Video error",
        ));
      }

      return right(result.items);
    } on DioError catch (e) {
      final code = e.response?.statusCode;
      final msg = e.response?.statusMessage;

      return left(Failure(
        status: code,
        message: msg,
      ));
    }
  }
}
