import 'package:freezed_annotation/freezed_annotation.dart';

part 'res_search_model.freezed.dart';
part 'res_search_model.g.dart';

@freezed
class ResSearchModel with _$ResSearchModel {
  factory ResSearchModel(
      {String? kind,
      String? etag,
      String? nextPageToken,
      String? regionCode,
      @Default([]) List<ResSearchItemModel> items}) = _ResSearchModel;

  factory ResSearchModel.fromJson(Map<String, dynamic> json) =>
      _$ResSearchModelFromJson(json);
}

@freezed
class ResSearchItemModel with _$ResSearchItemModel {
  factory ResSearchItemModel({
    String? kind,
    String? etag,
    Id? id,
    Snippet? snippet,
  }) = _ResSearchItemModel;

  factory ResSearchItemModel.fromJson(Map<String, dynamic> json) =>
      _$ResSearchItemModelFromJson(json);
}

@freezed
class Id with _$Id {
  factory Id({
    String? kind,
    String? videoId,
  }) = _Id;

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);
}

@freezed
class Snippet with _$Snippet {
  factory Snippet({
    String? publishedAt,
    String? channelId,
    String? title,
    String? description,
    ThumbnailsSearch? thumbnails,
    String? channelTitle,
    String? liveBroadcastContent,
    String? publishTime,
  }) = _Snippet;

  factory Snippet.fromJson(Map<String, dynamic> json) =>
      _$SnippetFromJson(json);
}

@freezed
class ThumbnailsSearch with _$ThumbnailsSearch {
  factory ThumbnailsSearch({
    DefaultImgSearch? medium,
    @JsonKey(name: 'default') DefaultImgSearch? defaultImage,
    DefaultImgSearch? high,
  }) = _ThumbnailsSearch;

  factory ThumbnailsSearch.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsSearchFromJson(json);
}

@freezed
class DefaultImgSearch with _$DefaultImgSearch {
  factory DefaultImgSearch({
    String? url,
    int? width,
    int? height,
  }) = _DefaultImgSearch;

  factory DefaultImgSearch.fromJson(Map<String, dynamic> json) =>
      _$DefaultImgSearchFromJson(json);
}
