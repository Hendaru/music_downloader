// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_gradient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ColorGradient _$$_ColorGradientFromJson(Map<String, dynamic> json) =>
    _$_ColorGradient(
      colorGradient: (json['colorGradient'] as List<dynamic>?)
          ?.map((e) => ListColorGradient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ColorGradientToJson(_$_ColorGradient instance) =>
    <String, dynamic>{
      'colorGradient': instance.colorGradient,
    };

_$_ListColorGradient _$$_ListColorGradientFromJson(Map<String, dynamic> json) =>
    _$_ListColorGradient(
      listGradientColorModel: (json['listGradientColorModel'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$$_ListColorGradientToJson(
        _$_ListColorGradient instance) =>
    <String, dynamic>{
      'listGradientColorModel': instance.listGradientColorModel,
    };
