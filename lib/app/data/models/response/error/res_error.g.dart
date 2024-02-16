// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResError _$$_ResErrorFromJson(Map<String, dynamic> json) => _$_ResError(
      status: json['status'] as int? ?? 909,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$_ResErrorToJson(_$_ResError instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

_$_Failure _$$_FailureFromJson(Map<String, dynamic> json) => _$_Failure(
      status: json['status'] as int?,
      message: json['message'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_FailureToJson(_$_Failure instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };
