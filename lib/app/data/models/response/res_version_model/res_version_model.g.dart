// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResVersionModel _$$_ResVersionModelFromJson(Map<String, dynamic> json) =>
    _$_ResVersionModel(
      meta: json['meta'] == null
          ? null
          : ResMusicMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : DataVersionModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ResVersionModelToJson(_$_ResVersionModel instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

_$_DataVersionModel _$$_DataVersionModelFromJson(Map<String, dynamic> json) =>
    _$_DataVersionModel(
      nameVersion: json['name_version'] as String?,
    );

Map<String, dynamic> _$$_DataVersionModelToJson(_$_DataVersionModel instance) =>
    <String, dynamic>{
      'name_version': instance.nameVersion,
    };
