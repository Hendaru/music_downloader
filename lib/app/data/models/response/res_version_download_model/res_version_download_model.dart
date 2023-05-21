import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';

part 'res_version_download_model.freezed.dart';
part 'res_version_download_model.g.dart';

@freezed
class ResVersionDownloadModel with _$ResVersionDownloadModel {
  const factory ResVersionDownloadModel(
      {ResMusicMetaModel? meta,
      List<DataVersionDownloadModel>? data}) = _ResVersionModel;

  factory ResVersionDownloadModel.fromJson(Map<String, dynamic> json) =>
      _$ResVersionDownloadModelFromJson(json);
}

@freezed
class DataVersionDownloadModel with _$DataVersionDownloadModel {
  const factory DataVersionDownloadModel({
    @JsonKey(name: "version_name") String? versionName,
  }) = _DataVersionDownloadModel;

  factory DataVersionDownloadModel.fromJson(Map<String, dynamic> json) =>
      _$DataVersionDownloadModelFromJson(json);
}
