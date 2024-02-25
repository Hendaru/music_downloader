// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResSearchModel _$$_ResSearchModelFromJson(Map<String, dynamic> json) =>
    _$_ResSearchModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      nextPageToken: json['nextPageToken'] as String?,
      regionCode: json['regionCode'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map(
                  (e) => ResSearchItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ResSearchModelToJson(_$_ResSearchModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'regionCode': instance.regionCode,
      'items': instance.items,
    };

_$_ResSearchItemModel _$$_ResSearchItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_ResSearchItemModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      id: json['id'] == null
          ? null
          : Id.fromJson(json['id'] as Map<String, dynamic>),
      snippet: json['snippet'] == null
          ? null
          : Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ResSearchItemModelToJson(
        _$_ResSearchItemModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'id': instance.id,
      'snippet': instance.snippet,
    };

_$_Id _$$_IdFromJson(Map<String, dynamic> json) => _$_Id(
      kind: json['kind'] as String?,
      videoId: json['videoId'] as String?,
    );

Map<String, dynamic> _$$_IdToJson(_$_Id instance) => <String, dynamic>{
      'kind': instance.kind,
      'videoId': instance.videoId,
    };

_$_Snippet _$$_SnippetFromJson(Map<String, dynamic> json) => _$_Snippet(
      publishedAt: json['publishedAt'] as String?,
      channelId: json['channelId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      thumbnails: json['thumbnails'] == null
          ? null
          : ThumbnailsSearch.fromJson(
              json['thumbnails'] as Map<String, dynamic>),
      channelTitle: json['channelTitle'] as String?,
      liveBroadcastContent: json['liveBroadcastContent'] as String?,
      publishTime: json['publishTime'] as String?,
    );

Map<String, dynamic> _$$_SnippetToJson(_$_Snippet instance) =>
    <String, dynamic>{
      'publishedAt': instance.publishedAt,
      'channelId': instance.channelId,
      'title': instance.title,
      'description': instance.description,
      'thumbnails': instance.thumbnails,
      'channelTitle': instance.channelTitle,
      'liveBroadcastContent': instance.liveBroadcastContent,
      'publishTime': instance.publishTime,
    };

_$_ThumbnailsSearch _$$_ThumbnailsSearchFromJson(Map<String, dynamic> json) =>
    _$_ThumbnailsSearch(
      medium: json['medium'] == null
          ? null
          : DefaultImgSearch.fromJson(json['medium'] as Map<String, dynamic>),
      defaultImage: json['default'] == null
          ? null
          : DefaultImgSearch.fromJson(json['default'] as Map<String, dynamic>),
      high: json['high'] == null
          ? null
          : DefaultImgSearch.fromJson(json['high'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ThumbnailsSearchToJson(_$_ThumbnailsSearch instance) =>
    <String, dynamic>{
      'medium': instance.medium,
      'default': instance.defaultImage,
      'high': instance.high,
    };

_$_DefaultImgSearch _$$_DefaultImgSearchFromJson(Map<String, dynamic> json) =>
    _$_DefaultImgSearch(
      url: json['url'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$$_DefaultImgSearchToJson(_$_DefaultImgSearch instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
