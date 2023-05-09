// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_downloaded_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResDownloadedModel _$$_ResDownloadedModelFromJson(
        Map<String, dynamic> json) =>
    _$_ResDownloadedModel(
      id: json['id'] as String? ?? '',
      idLike: json['idLike'] as String? ?? '',
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      path: json['path'] as String? ?? '',
    );

Map<String, dynamic> _$$_ResDownloadedModelToJson(
        _$_ResDownloadedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idLike': instance.idLike,
      'title': instance.title,
      'image': instance.image,
      'duration': instance.duration,
      'path': instance.path,
    };
