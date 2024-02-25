// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResSearchModel _$ResSearchModelFromJson(Map<String, dynamic> json) {
  return _ResSearchModel.fromJson(json);
}

/// @nodoc
mixin _$ResSearchModel {
  String? get kind => throw _privateConstructorUsedError;
  String? get etag => throw _privateConstructorUsedError;
  String? get nextPageToken => throw _privateConstructorUsedError;
  String? get regionCode => throw _privateConstructorUsedError;
  List<ResSearchItemModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResSearchModelCopyWith<ResSearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResSearchModelCopyWith<$Res> {
  factory $ResSearchModelCopyWith(
          ResSearchModel value, $Res Function(ResSearchModel) then) =
      _$ResSearchModelCopyWithImpl<$Res, ResSearchModel>;
  @useResult
  $Res call(
      {String? kind,
      String? etag,
      String? nextPageToken,
      String? regionCode,
      List<ResSearchItemModel> items});
}

/// @nodoc
class _$ResSearchModelCopyWithImpl<$Res, $Val extends ResSearchModel>
    implements $ResSearchModelCopyWith<$Res> {
  _$ResSearchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? nextPageToken = freezed,
    Object? regionCode = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      etag: freezed == etag
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPageToken: freezed == nextPageToken
          ? _value.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      regionCode: freezed == regionCode
          ? _value.regionCode
          : regionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ResSearchItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResSearchModelCopyWith<$Res>
    implements $ResSearchModelCopyWith<$Res> {
  factory _$$_ResSearchModelCopyWith(
          _$_ResSearchModel value, $Res Function(_$_ResSearchModel) then) =
      __$$_ResSearchModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? kind,
      String? etag,
      String? nextPageToken,
      String? regionCode,
      List<ResSearchItemModel> items});
}

/// @nodoc
class __$$_ResSearchModelCopyWithImpl<$Res>
    extends _$ResSearchModelCopyWithImpl<$Res, _$_ResSearchModel>
    implements _$$_ResSearchModelCopyWith<$Res> {
  __$$_ResSearchModelCopyWithImpl(
      _$_ResSearchModel _value, $Res Function(_$_ResSearchModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? nextPageToken = freezed,
    Object? regionCode = freezed,
    Object? items = null,
  }) {
    return _then(_$_ResSearchModel(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      etag: freezed == etag
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPageToken: freezed == nextPageToken
          ? _value.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      regionCode: freezed == regionCode
          ? _value.regionCode
          : regionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ResSearchItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResSearchModel implements _ResSearchModel {
  _$_ResSearchModel(
      {this.kind,
      this.etag,
      this.nextPageToken,
      this.regionCode,
      final List<ResSearchItemModel> items = const []})
      : _items = items;

  factory _$_ResSearchModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResSearchModelFromJson(json);

  @override
  final String? kind;
  @override
  final String? etag;
  @override
  final String? nextPageToken;
  @override
  final String? regionCode;
  final List<ResSearchItemModel> _items;
  @override
  @JsonKey()
  List<ResSearchItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ResSearchModel(kind: $kind, etag: $etag, nextPageToken: $nextPageToken, regionCode: $regionCode, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResSearchModel &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.etag, etag) || other.etag == etag) &&
            (identical(other.nextPageToken, nextPageToken) ||
                other.nextPageToken == nextPageToken) &&
            (identical(other.regionCode, regionCode) ||
                other.regionCode == regionCode) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kind, etag, nextPageToken,
      regionCode, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResSearchModelCopyWith<_$_ResSearchModel> get copyWith =>
      __$$_ResSearchModelCopyWithImpl<_$_ResSearchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResSearchModelToJson(
      this,
    );
  }
}

abstract class _ResSearchModel implements ResSearchModel {
  factory _ResSearchModel(
      {final String? kind,
      final String? etag,
      final String? nextPageToken,
      final String? regionCode,
      final List<ResSearchItemModel> items}) = _$_ResSearchModel;

  factory _ResSearchModel.fromJson(Map<String, dynamic> json) =
      _$_ResSearchModel.fromJson;

  @override
  String? get kind;
  @override
  String? get etag;
  @override
  String? get nextPageToken;
  @override
  String? get regionCode;
  @override
  List<ResSearchItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ResSearchModelCopyWith<_$_ResSearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ResSearchItemModel _$ResSearchItemModelFromJson(Map<String, dynamic> json) {
  return _ResSearchItemModel.fromJson(json);
}

/// @nodoc
mixin _$ResSearchItemModel {
  String? get kind => throw _privateConstructorUsedError;
  String? get etag => throw _privateConstructorUsedError;
  Id? get id => throw _privateConstructorUsedError;
  Snippet? get snippet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResSearchItemModelCopyWith<ResSearchItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResSearchItemModelCopyWith<$Res> {
  factory $ResSearchItemModelCopyWith(
          ResSearchItemModel value, $Res Function(ResSearchItemModel) then) =
      _$ResSearchItemModelCopyWithImpl<$Res, ResSearchItemModel>;
  @useResult
  $Res call({String? kind, String? etag, Id? id, Snippet? snippet});

  $IdCopyWith<$Res>? get id;
  $SnippetCopyWith<$Res>? get snippet;
}

/// @nodoc
class _$ResSearchItemModelCopyWithImpl<$Res, $Val extends ResSearchItemModel>
    implements $ResSearchItemModelCopyWith<$Res> {
  _$ResSearchItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? id = freezed,
    Object? snippet = freezed,
  }) {
    return _then(_value.copyWith(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      etag: freezed == etag
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Id?,
      snippet: freezed == snippet
          ? _value.snippet
          : snippet // ignore: cast_nullable_to_non_nullable
              as Snippet?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdCopyWith<$Res>? get id {
    if (_value.id == null) {
      return null;
    }

    return $IdCopyWith<$Res>(_value.id!, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SnippetCopyWith<$Res>? get snippet {
    if (_value.snippet == null) {
      return null;
    }

    return $SnippetCopyWith<$Res>(_value.snippet!, (value) {
      return _then(_value.copyWith(snippet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ResSearchItemModelCopyWith<$Res>
    implements $ResSearchItemModelCopyWith<$Res> {
  factory _$$_ResSearchItemModelCopyWith(_$_ResSearchItemModel value,
          $Res Function(_$_ResSearchItemModel) then) =
      __$$_ResSearchItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? kind, String? etag, Id? id, Snippet? snippet});

  @override
  $IdCopyWith<$Res>? get id;
  @override
  $SnippetCopyWith<$Res>? get snippet;
}

/// @nodoc
class __$$_ResSearchItemModelCopyWithImpl<$Res>
    extends _$ResSearchItemModelCopyWithImpl<$Res, _$_ResSearchItemModel>
    implements _$$_ResSearchItemModelCopyWith<$Res> {
  __$$_ResSearchItemModelCopyWithImpl(
      _$_ResSearchItemModel _value, $Res Function(_$_ResSearchItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? id = freezed,
    Object? snippet = freezed,
  }) {
    return _then(_$_ResSearchItemModel(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      etag: freezed == etag
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Id?,
      snippet: freezed == snippet
          ? _value.snippet
          : snippet // ignore: cast_nullable_to_non_nullable
              as Snippet?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResSearchItemModel implements _ResSearchItemModel {
  _$_ResSearchItemModel({this.kind, this.etag, this.id, this.snippet});

  factory _$_ResSearchItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResSearchItemModelFromJson(json);

  @override
  final String? kind;
  @override
  final String? etag;
  @override
  final Id? id;
  @override
  final Snippet? snippet;

  @override
  String toString() {
    return 'ResSearchItemModel(kind: $kind, etag: $etag, id: $id, snippet: $snippet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResSearchItemModel &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.etag, etag) || other.etag == etag) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.snippet, snippet) || other.snippet == snippet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kind, etag, id, snippet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResSearchItemModelCopyWith<_$_ResSearchItemModel> get copyWith =>
      __$$_ResSearchItemModelCopyWithImpl<_$_ResSearchItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResSearchItemModelToJson(
      this,
    );
  }
}

abstract class _ResSearchItemModel implements ResSearchItemModel {
  factory _ResSearchItemModel(
      {final String? kind,
      final String? etag,
      final Id? id,
      final Snippet? snippet}) = _$_ResSearchItemModel;

  factory _ResSearchItemModel.fromJson(Map<String, dynamic> json) =
      _$_ResSearchItemModel.fromJson;

  @override
  String? get kind;
  @override
  String? get etag;
  @override
  Id? get id;
  @override
  Snippet? get snippet;
  @override
  @JsonKey(ignore: true)
  _$$_ResSearchItemModelCopyWith<_$_ResSearchItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Id _$IdFromJson(Map<String, dynamic> json) {
  return _Id.fromJson(json);
}

/// @nodoc
mixin _$Id {
  String? get kind => throw _privateConstructorUsedError;
  String? get videoId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdCopyWith<Id> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdCopyWith<$Res> {
  factory $IdCopyWith(Id value, $Res Function(Id) then) =
      _$IdCopyWithImpl<$Res, Id>;
  @useResult
  $Res call({String? kind, String? videoId});
}

/// @nodoc
class _$IdCopyWithImpl<$Res, $Val extends Id> implements $IdCopyWith<$Res> {
  _$IdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? videoId = freezed,
  }) {
    return _then(_value.copyWith(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IdCopyWith<$Res> implements $IdCopyWith<$Res> {
  factory _$$_IdCopyWith(_$_Id value, $Res Function(_$_Id) then) =
      __$$_IdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? kind, String? videoId});
}

/// @nodoc
class __$$_IdCopyWithImpl<$Res> extends _$IdCopyWithImpl<$Res, _$_Id>
    implements _$$_IdCopyWith<$Res> {
  __$$_IdCopyWithImpl(_$_Id _value, $Res Function(_$_Id) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? videoId = freezed,
  }) {
    return _then(_$_Id(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Id implements _Id {
  _$_Id({this.kind, this.videoId});

  factory _$_Id.fromJson(Map<String, dynamic> json) => _$$_IdFromJson(json);

  @override
  final String? kind;
  @override
  final String? videoId;

  @override
  String toString() {
    return 'Id(kind: $kind, videoId: $videoId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Id &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.videoId, videoId) || other.videoId == videoId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kind, videoId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdCopyWith<_$_Id> get copyWith =>
      __$$_IdCopyWithImpl<_$_Id>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdToJson(
      this,
    );
  }
}

abstract class _Id implements Id {
  factory _Id({final String? kind, final String? videoId}) = _$_Id;

  factory _Id.fromJson(Map<String, dynamic> json) = _$_Id.fromJson;

  @override
  String? get kind;
  @override
  String? get videoId;
  @override
  @JsonKey(ignore: true)
  _$$_IdCopyWith<_$_Id> get copyWith => throw _privateConstructorUsedError;
}

Snippet _$SnippetFromJson(Map<String, dynamic> json) {
  return _Snippet.fromJson(json);
}

/// @nodoc
mixin _$Snippet {
  String? get publishedAt => throw _privateConstructorUsedError;
  String? get channelId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  ThumbnailsSearch? get thumbnails => throw _privateConstructorUsedError;
  String? get channelTitle => throw _privateConstructorUsedError;
  String? get liveBroadcastContent => throw _privateConstructorUsedError;
  String? get publishTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnippetCopyWith<Snippet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnippetCopyWith<$Res> {
  factory $SnippetCopyWith(Snippet value, $Res Function(Snippet) then) =
      _$SnippetCopyWithImpl<$Res, Snippet>;
  @useResult
  $Res call(
      {String? publishedAt,
      String? channelId,
      String? title,
      String? description,
      ThumbnailsSearch? thumbnails,
      String? channelTitle,
      String? liveBroadcastContent,
      String? publishTime});

  $ThumbnailsSearchCopyWith<$Res>? get thumbnails;
}

/// @nodoc
class _$SnippetCopyWithImpl<$Res, $Val extends Snippet>
    implements $SnippetCopyWith<$Res> {
  _$SnippetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishedAt = freezed,
    Object? channelId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? thumbnails = freezed,
    Object? channelTitle = freezed,
    Object? liveBroadcastContent = freezed,
    Object? publishTime = freezed,
  }) {
    return _then(_value.copyWith(
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      channelId: freezed == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnails: freezed == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as ThumbnailsSearch?,
      channelTitle: freezed == channelTitle
          ? _value.channelTitle
          : channelTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      liveBroadcastContent: freezed == liveBroadcastContent
          ? _value.liveBroadcastContent
          : liveBroadcastContent // ignore: cast_nullable_to_non_nullable
              as String?,
      publishTime: freezed == publishTime
          ? _value.publishTime
          : publishTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThumbnailsSearchCopyWith<$Res>? get thumbnails {
    if (_value.thumbnails == null) {
      return null;
    }

    return $ThumbnailsSearchCopyWith<$Res>(_value.thumbnails!, (value) {
      return _then(_value.copyWith(thumbnails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SnippetCopyWith<$Res> implements $SnippetCopyWith<$Res> {
  factory _$$_SnippetCopyWith(
          _$_Snippet value, $Res Function(_$_Snippet) then) =
      __$$_SnippetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? publishedAt,
      String? channelId,
      String? title,
      String? description,
      ThumbnailsSearch? thumbnails,
      String? channelTitle,
      String? liveBroadcastContent,
      String? publishTime});

  @override
  $ThumbnailsSearchCopyWith<$Res>? get thumbnails;
}

/// @nodoc
class __$$_SnippetCopyWithImpl<$Res>
    extends _$SnippetCopyWithImpl<$Res, _$_Snippet>
    implements _$$_SnippetCopyWith<$Res> {
  __$$_SnippetCopyWithImpl(_$_Snippet _value, $Res Function(_$_Snippet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishedAt = freezed,
    Object? channelId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? thumbnails = freezed,
    Object? channelTitle = freezed,
    Object? liveBroadcastContent = freezed,
    Object? publishTime = freezed,
  }) {
    return _then(_$_Snippet(
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      channelId: freezed == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnails: freezed == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as ThumbnailsSearch?,
      channelTitle: freezed == channelTitle
          ? _value.channelTitle
          : channelTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      liveBroadcastContent: freezed == liveBroadcastContent
          ? _value.liveBroadcastContent
          : liveBroadcastContent // ignore: cast_nullable_to_non_nullable
              as String?,
      publishTime: freezed == publishTime
          ? _value.publishTime
          : publishTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Snippet implements _Snippet {
  _$_Snippet(
      {this.publishedAt,
      this.channelId,
      this.title,
      this.description,
      this.thumbnails,
      this.channelTitle,
      this.liveBroadcastContent,
      this.publishTime});

  factory _$_Snippet.fromJson(Map<String, dynamic> json) =>
      _$$_SnippetFromJson(json);

  @override
  final String? publishedAt;
  @override
  final String? channelId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final ThumbnailsSearch? thumbnails;
  @override
  final String? channelTitle;
  @override
  final String? liveBroadcastContent;
  @override
  final String? publishTime;

  @override
  String toString() {
    return 'Snippet(publishedAt: $publishedAt, channelId: $channelId, title: $title, description: $description, thumbnails: $thumbnails, channelTitle: $channelTitle, liveBroadcastContent: $liveBroadcastContent, publishTime: $publishTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Snippet &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnails, thumbnails) ||
                other.thumbnails == thumbnails) &&
            (identical(other.channelTitle, channelTitle) ||
                other.channelTitle == channelTitle) &&
            (identical(other.liveBroadcastContent, liveBroadcastContent) ||
                other.liveBroadcastContent == liveBroadcastContent) &&
            (identical(other.publishTime, publishTime) ||
                other.publishTime == publishTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, publishedAt, channelId, title,
      description, thumbnails, channelTitle, liveBroadcastContent, publishTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SnippetCopyWith<_$_Snippet> get copyWith =>
      __$$_SnippetCopyWithImpl<_$_Snippet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SnippetToJson(
      this,
    );
  }
}

abstract class _Snippet implements Snippet {
  factory _Snippet(
      {final String? publishedAt,
      final String? channelId,
      final String? title,
      final String? description,
      final ThumbnailsSearch? thumbnails,
      final String? channelTitle,
      final String? liveBroadcastContent,
      final String? publishTime}) = _$_Snippet;

  factory _Snippet.fromJson(Map<String, dynamic> json) = _$_Snippet.fromJson;

  @override
  String? get publishedAt;
  @override
  String? get channelId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  ThumbnailsSearch? get thumbnails;
  @override
  String? get channelTitle;
  @override
  String? get liveBroadcastContent;
  @override
  String? get publishTime;
  @override
  @JsonKey(ignore: true)
  _$$_SnippetCopyWith<_$_Snippet> get copyWith =>
      throw _privateConstructorUsedError;
}

ThumbnailsSearch _$ThumbnailsSearchFromJson(Map<String, dynamic> json) {
  return _ThumbnailsSearch.fromJson(json);
}

/// @nodoc
mixin _$ThumbnailsSearch {
  DefaultImgSearch? get medium => throw _privateConstructorUsedError;
  @JsonKey(name: 'default')
  DefaultImgSearch? get defaultImage => throw _privateConstructorUsedError;
  DefaultImgSearch? get high => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThumbnailsSearchCopyWith<ThumbnailsSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThumbnailsSearchCopyWith<$Res> {
  factory $ThumbnailsSearchCopyWith(
          ThumbnailsSearch value, $Res Function(ThumbnailsSearch) then) =
      _$ThumbnailsSearchCopyWithImpl<$Res, ThumbnailsSearch>;
  @useResult
  $Res call(
      {DefaultImgSearch? medium,
      @JsonKey(name: 'default') DefaultImgSearch? defaultImage,
      DefaultImgSearch? high});

  $DefaultImgSearchCopyWith<$Res>? get medium;
  $DefaultImgSearchCopyWith<$Res>? get defaultImage;
  $DefaultImgSearchCopyWith<$Res>? get high;
}

/// @nodoc
class _$ThumbnailsSearchCopyWithImpl<$Res, $Val extends ThumbnailsSearch>
    implements $ThumbnailsSearchCopyWith<$Res> {
  _$ThumbnailsSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medium = freezed,
    Object? defaultImage = freezed,
    Object? high = freezed,
  }) {
    return _then(_value.copyWith(
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as DefaultImgSearch?,
      defaultImage: freezed == defaultImage
          ? _value.defaultImage
          : defaultImage // ignore: cast_nullable_to_non_nullable
              as DefaultImgSearch?,
      high: freezed == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as DefaultImgSearch?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DefaultImgSearchCopyWith<$Res>? get medium {
    if (_value.medium == null) {
      return null;
    }

    return $DefaultImgSearchCopyWith<$Res>(_value.medium!, (value) {
      return _then(_value.copyWith(medium: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DefaultImgSearchCopyWith<$Res>? get defaultImage {
    if (_value.defaultImage == null) {
      return null;
    }

    return $DefaultImgSearchCopyWith<$Res>(_value.defaultImage!, (value) {
      return _then(_value.copyWith(defaultImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DefaultImgSearchCopyWith<$Res>? get high {
    if (_value.high == null) {
      return null;
    }

    return $DefaultImgSearchCopyWith<$Res>(_value.high!, (value) {
      return _then(_value.copyWith(high: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ThumbnailsSearchCopyWith<$Res>
    implements $ThumbnailsSearchCopyWith<$Res> {
  factory _$$_ThumbnailsSearchCopyWith(
          _$_ThumbnailsSearch value, $Res Function(_$_ThumbnailsSearch) then) =
      __$$_ThumbnailsSearchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DefaultImgSearch? medium,
      @JsonKey(name: 'default') DefaultImgSearch? defaultImage,
      DefaultImgSearch? high});

  @override
  $DefaultImgSearchCopyWith<$Res>? get medium;
  @override
  $DefaultImgSearchCopyWith<$Res>? get defaultImage;
  @override
  $DefaultImgSearchCopyWith<$Res>? get high;
}

/// @nodoc
class __$$_ThumbnailsSearchCopyWithImpl<$Res>
    extends _$ThumbnailsSearchCopyWithImpl<$Res, _$_ThumbnailsSearch>
    implements _$$_ThumbnailsSearchCopyWith<$Res> {
  __$$_ThumbnailsSearchCopyWithImpl(
      _$_ThumbnailsSearch _value, $Res Function(_$_ThumbnailsSearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medium = freezed,
    Object? defaultImage = freezed,
    Object? high = freezed,
  }) {
    return _then(_$_ThumbnailsSearch(
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as DefaultImgSearch?,
      defaultImage: freezed == defaultImage
          ? _value.defaultImage
          : defaultImage // ignore: cast_nullable_to_non_nullable
              as DefaultImgSearch?,
      high: freezed == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as DefaultImgSearch?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ThumbnailsSearch implements _ThumbnailsSearch {
  _$_ThumbnailsSearch(
      {this.medium, @JsonKey(name: 'default') this.defaultImage, this.high});

  factory _$_ThumbnailsSearch.fromJson(Map<String, dynamic> json) =>
      _$$_ThumbnailsSearchFromJson(json);

  @override
  final DefaultImgSearch? medium;
  @override
  @JsonKey(name: 'default')
  final DefaultImgSearch? defaultImage;
  @override
  final DefaultImgSearch? high;

  @override
  String toString() {
    return 'ThumbnailsSearch(medium: $medium, defaultImage: $defaultImage, high: $high)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThumbnailsSearch &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.defaultImage, defaultImage) ||
                other.defaultImage == defaultImage) &&
            (identical(other.high, high) || other.high == high));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, medium, defaultImage, high);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThumbnailsSearchCopyWith<_$_ThumbnailsSearch> get copyWith =>
      __$$_ThumbnailsSearchCopyWithImpl<_$_ThumbnailsSearch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThumbnailsSearchToJson(
      this,
    );
  }
}

abstract class _ThumbnailsSearch implements ThumbnailsSearch {
  factory _ThumbnailsSearch(
      {final DefaultImgSearch? medium,
      @JsonKey(name: 'default') final DefaultImgSearch? defaultImage,
      final DefaultImgSearch? high}) = _$_ThumbnailsSearch;

  factory _ThumbnailsSearch.fromJson(Map<String, dynamic> json) =
      _$_ThumbnailsSearch.fromJson;

  @override
  DefaultImgSearch? get medium;
  @override
  @JsonKey(name: 'default')
  DefaultImgSearch? get defaultImage;
  @override
  DefaultImgSearch? get high;
  @override
  @JsonKey(ignore: true)
  _$$_ThumbnailsSearchCopyWith<_$_ThumbnailsSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

DefaultImgSearch _$DefaultImgSearchFromJson(Map<String, dynamic> json) {
  return _DefaultImgSearch.fromJson(json);
}

/// @nodoc
mixin _$DefaultImgSearch {
  String? get url => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultImgSearchCopyWith<DefaultImgSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultImgSearchCopyWith<$Res> {
  factory $DefaultImgSearchCopyWith(
          DefaultImgSearch value, $Res Function(DefaultImgSearch) then) =
      _$DefaultImgSearchCopyWithImpl<$Res, DefaultImgSearch>;
  @useResult
  $Res call({String? url, int? width, int? height});
}

/// @nodoc
class _$DefaultImgSearchCopyWithImpl<$Res, $Val extends DefaultImgSearch>
    implements $DefaultImgSearchCopyWith<$Res> {
  _$DefaultImgSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DefaultImgSearchCopyWith<$Res>
    implements $DefaultImgSearchCopyWith<$Res> {
  factory _$$_DefaultImgSearchCopyWith(
          _$_DefaultImgSearch value, $Res Function(_$_DefaultImgSearch) then) =
      __$$_DefaultImgSearchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, int? width, int? height});
}

/// @nodoc
class __$$_DefaultImgSearchCopyWithImpl<$Res>
    extends _$DefaultImgSearchCopyWithImpl<$Res, _$_DefaultImgSearch>
    implements _$$_DefaultImgSearchCopyWith<$Res> {
  __$$_DefaultImgSearchCopyWithImpl(
      _$_DefaultImgSearch _value, $Res Function(_$_DefaultImgSearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_$_DefaultImgSearch(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DefaultImgSearch implements _DefaultImgSearch {
  _$_DefaultImgSearch({this.url, this.width, this.height});

  factory _$_DefaultImgSearch.fromJson(Map<String, dynamic> json) =>
      _$$_DefaultImgSearchFromJson(json);

  @override
  final String? url;
  @override
  final int? width;
  @override
  final int? height;

  @override
  String toString() {
    return 'DefaultImgSearch(url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DefaultImgSearch &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, width, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DefaultImgSearchCopyWith<_$_DefaultImgSearch> get copyWith =>
      __$$_DefaultImgSearchCopyWithImpl<_$_DefaultImgSearch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DefaultImgSearchToJson(
      this,
    );
  }
}

abstract class _DefaultImgSearch implements DefaultImgSearch {
  factory _DefaultImgSearch(
      {final String? url,
      final int? width,
      final int? height}) = _$_DefaultImgSearch;

  factory _DefaultImgSearch.fromJson(Map<String, dynamic> json) =
      _$_DefaultImgSearch.fromJson;

  @override
  String? get url;
  @override
  int? get width;
  @override
  int? get height;
  @override
  @JsonKey(ignore: true)
  _$$_DefaultImgSearchCopyWith<_$_DefaultImgSearch> get copyWith =>
      throw _privateConstructorUsedError;
}
