import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_gradient_model.freezed.dart';
part 'color_gradient_model.g.dart';

@freezed
class ColorGradient with _$ColorGradient {
  factory ColorGradient({
    List<ListColorGradient>? colorGradient,
  }) = _ColorGradient;

  factory ColorGradient.fromJson(Map<String, dynamic> json) =>
      _$ColorGradientFromJson(json);
}

@freezed
class ListColorGradient with _$ListColorGradient {
  factory ListColorGradient({
    List<int>? listGradientColorModel,
  }) = _ListColorGradient;

  factory ListColorGradient.fromJson(Map<String, dynamic> json) =>
      _$ListColorGradientFromJson(json);
}
