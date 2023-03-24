// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResMusicModel _$$_ResMusicModelFromJson(Map<String, dynamic> json) =>
    _$_ResMusicModel(
      meta: json['meta'] == null
          ? null
          : ResMusicMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => ResMusicDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ResMusicModelToJson(_$_ResMusicModel instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

_$_ResMusicMetaModel _$$_ResMusicMetaModelFromJson(Map<String, dynamic> json) =>
    _$_ResMusicMetaModel(
      message: json['message'] as String?,
      code: json['code'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_ResMusicMetaModelToJson(
        _$_ResMusicMetaModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'status': instance.status,
    };

_$_ResMusicDataModel _$$_ResMusicDataModelFromJson(Map<String, dynamic> json) =>
    _$_ResMusicDataModel(
      id: json['id'] as String? ?? '',
      idArtist: json['id_artist'] as String? ?? '',
      idGenre: json['id_genre'] as String? ?? '',
      idPlayList: json['idPlayList'] as String? ?? '',
      idLike: json['idLike'] as String? ?? '',
      judulLagu: json['judul_lagu'] as String? ?? '',
      imageLagu: json['image_lagu'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      assetLagu: json['asset_lagu'] as String? ?? '',
      localLagu: json['localLagu'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$$_ResMusicDataModelToJson(
        _$_ResMusicDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_artist': instance.idArtist,
      'id_genre': instance.idGenre,
      'idPlayList': instance.idPlayList,
      'idLike': instance.idLike,
      'judul_lagu': instance.judulLagu,
      'image_lagu': instance.imageLagu,
      'duration': instance.duration,
      'asset_lagu': instance.assetLagu,
      'localLagu': instance.localLagu,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
