import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_progress_model.freezed.dart';
part 'download_progress_model.g.dart';

@freezed
class DownloadProgressModel with _$DownloadProgressModel {
  factory DownloadProgressModel({
    @Default(false) bool completeDownload,
    @Default(0.0) double progresDownload,
  }) = _DownloadProgressModel;

  factory DownloadProgressModel.fromJson(Map<String, dynamic> json) =>
      _$DownloadProgressModelFromJson(json);
}
