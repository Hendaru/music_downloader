import 'package:freezed_annotation/freezed_annotation.dart';

part 'res_downloaded_model.freezed.dart';
part 'res_downloaded_model.g.dart';

@freezed
class ResDownloadedModel with _$ResDownloadedModel {
  factory ResDownloadedModel({
    @Default('') String? id,
    @Default('') String? idLike,
    @Default('') @JsonKey(name: "title") String? title,
    @Default('') @JsonKey(name: "image") String? image,
    @Default('') String? duration,
    @Default('') String? path,
  }) = _ResDownloadedModel;

  factory ResDownloadedModel.fromJson(Map<String, dynamic> json) =>
      _$ResDownloadedModelFromJson(json);
}
