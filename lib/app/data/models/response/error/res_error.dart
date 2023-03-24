import 'package:freezed_annotation/freezed_annotation.dart';

part 'res_error.freezed.dart';
part 'res_error.g.dart';

@freezed
class ResError with _$ResError {
  const factory ResError({
    @Default(909) int status,
    @Default('') String message,
  }) = _ResError;

  factory ResError.fromJson(Map<String, dynamic> json) =>
      _$ResErrorFromJson(json);
}
