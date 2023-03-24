import 'package:freezed_annotation/freezed_annotation.dart';

part 'res_music_model.freezed.dart';
part 'res_music_model.g.dart';

@freezed
class ResMusicModel with _$ResMusicModel {
  factory ResMusicModel({
    ResMusicMetaModel? meta,
    @Default([]) List<ResMusicDataModel>? data,
  }) = _ResMusicModel;

  factory ResMusicModel.fromJson(Map<String, dynamic> json) =>
      _$ResMusicModelFromJson(json);
}

@freezed
class ResMusicMetaModel with _$ResMusicMetaModel {
  factory ResMusicMetaModel({
    String? message,
    int? code,
    String? status,
  }) = _ResMusicMetaModel;

  factory ResMusicMetaModel.fromJson(Map<String, dynamic> json) =>
      _$ResMusicMetaModelFromJson(json);
}

@freezed
class ResMusicDataModel with _$ResMusicDataModel {
  factory ResMusicDataModel({
    @Default('') String? id,
    @Default('') @JsonKey(name: "id_artist") String? idArtist,
    @Default('') @JsonKey(name: "id_genre") String? idGenre,
    @Default('') String? idPlayList,
    @Default('') String? idLike,
    @Default('') @JsonKey(name: "judul_lagu") String? judulLagu,
    @Default('') @JsonKey(name: "image_lagu") String? imageLagu,
    @Default('') String? duration,
    @Default('') @JsonKey(name: "asset_lagu") String? assetLagu,
    @Default('') String? localLagu,
    @Default('') @JsonKey(name: "created_at") String? createdAt,
    @Default('') @JsonKey(name: "updated_at") String? updatedAt,
  }) = _ResMusicDataModel;

  factory ResMusicDataModel.fromJson(Map<String, dynamic> json) =>
      _$ResMusicDataModelFromJson(json);
}
