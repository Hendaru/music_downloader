// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_url_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResUrlVideoModel _$$_ResUrlVideoModelFromJson(Map<String, dynamic> json) =>
    _$_ResUrlVideoModel(
      meta: json['meta'] == null
          ? null
          : ResMusicMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : DataUrlVideoModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ResUrlVideoModelToJson(_$_ResUrlVideoModel instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

_$_DataUrlVideoModel _$$_DataUrlVideoModelFromJson(Map<String, dynamic> json) =>
    _$_DataUrlVideoModel(
      url: json['url'] as String?,
      title: json['title'] as String?,
      thumbnails: json['thumbnails'] as String?,
      duration: json['duration'] as String?,
    );

Map<String, dynamic> _$$_DataUrlVideoModelToJson(
        _$_DataUrlVideoModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'thumbnails': instance.thumbnails,
      'duration': instance.duration,
    };
