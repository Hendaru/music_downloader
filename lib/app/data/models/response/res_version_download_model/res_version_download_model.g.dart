// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_version_download_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResVersionModel _$$_ResVersionModelFromJson(Map<String, dynamic> json) =>
    _$_ResVersionModel(
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DataVersionDownloadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResVersionModelToJson(_$_ResVersionModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

_$_DataVersionDownloadModel _$$_DataVersionDownloadModelFromJson(
        Map<String, dynamic> json) =>
    _$_DataVersionDownloadModel(
      nameVersion: json['name'] as String?,
      appName: json['app_name'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$_DataVersionDownloadModelToJson(
        _$_DataVersionDownloadModel instance) =>
    <String, dynamic>{
      'name': instance.nameVersion,
      'app_name': instance.appName,
      'id': instance.id,
    };
