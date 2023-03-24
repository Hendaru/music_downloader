// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_bar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProgressBarModel _$$_ProgressBarModelFromJson(Map<String, dynamic> json) =>
    _$_ProgressBarModel(
      current: json['current'] == null
          ? Duration.zero
          : Duration(microseconds: json['current'] as int),
      buffered: json['buffered'] == null
          ? Duration.zero
          : Duration(microseconds: json['buffered'] as int),
      total: json['total'] == null
          ? Duration.zero
          : Duration(microseconds: json['total'] as int),
    );

Map<String, dynamic> _$$_ProgressBarModelToJson(_$_ProgressBarModel instance) =>
    <String, dynamic>{
      'current': instance.current.inMicroseconds,
      'buffered': instance.buffered.inMicroseconds,
      'total': instance.total.inMicroseconds,
    };
