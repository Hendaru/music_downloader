import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';

part 'res_version_model.freezed.dart';
part 'res_version_model.g.dart';

@freezed
class ResVersionModel with _$ResVersionModel {
  const factory ResVersionModel(
      {ResMusicMetaModel? meta, DataVersionModel? data}) = _ResVersionModel;

  factory ResVersionModel.fromJson(Map<String, dynamic> json) =>
      _$ResVersionModelFromJson(json);
}

@freezed
class DataVersionModel with _$DataVersionModel {
  const factory DataVersionModel({
    @JsonKey(name: "name_version") String? nameVersion,
  }) = _DataVersionModel;

  factory DataVersionModel.fromJson(Map<String, dynamic> json) =>
      _$DataVersionModelFromJson(json);
}
