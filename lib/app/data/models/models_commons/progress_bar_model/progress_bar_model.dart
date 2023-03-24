import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_bar_model.freezed.dart';
part 'progress_bar_model.g.dart';

@freezed
class ProgressBarModel with _$ProgressBarModel {
  factory ProgressBarModel({
    @Default(Duration.zero) Duration current,
    @Default(Duration.zero) Duration buffered,
    @Default(Duration.zero) Duration total,
  }) = _ProgressBarModel;

  factory ProgressBarModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressBarModelFromJson(json);
}
