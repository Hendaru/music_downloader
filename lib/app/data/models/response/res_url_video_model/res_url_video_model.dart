import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';

part 'res_url_video_model.freezed.dart';
part 'res_url_video_model.g.dart';

@freezed
class ResUrlVideoModel with _$ResUrlVideoModel {
  const factory ResUrlVideoModel(
      {ResMusicMetaModel? meta, DataUrlVideoModel? data}) = _ResUrlVideoModel;

  factory ResUrlVideoModel.fromJson(Map<String, dynamic> json) =>
      _$ResUrlVideoModelFromJson(json);
}

@freezed
class DataUrlVideoModel with _$DataUrlVideoModel {
  const factory DataUrlVideoModel({
    String? url,
    String? title,
    String? thumbnails,
    String? duration,
  }) = _DataUrlVideoModel;

  factory DataUrlVideoModel.fromJson(Map<String, dynamic> json) =>
      _$DataUrlVideoModelFromJson(json);
}
