import 'package:dio/dio.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_url_video_model/res_url_video_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_version_model/res_version_model.dart';
import 'package:retrofit/retrofit.dart';

part 'music_service.g.dart';

@RestApi()
abstract class MusicService {
  factory MusicService(Dio dio) = _MusicService;

  @GET("/music")
  Future<ResMusicModel> getMusicService();

  @GET("/you/{id}")
  Future<ResUrlVideoModel> getUrlVideoService(
    @Path('id') String id,
  );

  @GET("/versionyou")
  Future<ResVersionModel> getVersionService();
}
