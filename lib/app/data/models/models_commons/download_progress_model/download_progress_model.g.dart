// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DownloadProgressModel _$$_DownloadProgressModelFromJson(
        Map<String, dynamic> json) =>
    _$_DownloadProgressModel(
      completeDownload: json['completeDownload'] as bool? ?? false,
      progresDownload: (json['progresDownload'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_DownloadProgressModelToJson(
        _$_DownloadProgressModel instance) =>
    <String, dynamic>{
      'completeDownload': instance.completeDownload,
      'progresDownload': instance.progresDownload,
    };
