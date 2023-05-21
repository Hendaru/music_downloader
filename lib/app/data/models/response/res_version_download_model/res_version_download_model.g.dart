// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_version_download_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResVersionModel _$$_ResVersionModelFromJson(Map<String, dynamic> json) =>
    _$_ResVersionModel(
      meta: json['meta'] == null
          ? null
          : ResMusicMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DataVersionDownloadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResVersionModelToJson(_$_ResVersionModel instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

_$_DataVersionDownloadModel _$$_DataVersionDownloadModelFromJson(
        Map<String, dynamic> json) =>
    _$_DataVersionDownloadModel(
      versionName: json['version_name'] as String?,
    );

Map<String, dynamic> _$$_DataVersionDownloadModelToJson(
        _$_DataVersionDownloadModel instance) =>
    <String, dynamic>{
      'version_name': instance.versionName,
    };
