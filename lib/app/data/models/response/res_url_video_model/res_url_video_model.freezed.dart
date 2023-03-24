// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_url_video_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResUrlVideoModel _$ResUrlVideoModelFromJson(Map<String, dynamic> json) {
  return _ResUrlVideoModel.fromJson(json);
}

/// @nodoc
mixin _$ResUrlVideoModel {
  ResMusicMetaModel? get meta => throw _privateConstructorUsedError;
  DataUrlVideoModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResUrlVideoModelCopyWith<ResUrlVideoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResUrlVideoModelCopyWith<$Res> {
  factory $ResUrlVideoModelCopyWith(
          ResUrlVideoModel value, $Res Function(ResUrlVideoModel) then) =
      _$ResUrlVideoModelCopyWithImpl<$Res, ResUrlVideoModel>;
  @useResult
  $Res call({ResMusicMetaModel? meta, DataUrlVideoModel? data});

  $ResMusicMetaModelCopyWith<$Res>? get meta;
  $DataUrlVideoModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$ResUrlVideoModelCopyWithImpl<$Res, $Val extends ResUrlVideoModel>
    implements $ResUrlVideoModelCopyWith<$Res> {
  _$ResUrlVideoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ResMusicMetaModel?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataUrlVideoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResMusicMetaModelCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $ResMusicMetaModelCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DataUrlVideoModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataUrlVideoModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ResUrlVideoModelCopyWith<$Res>
    implements $ResUrlVideoModelCopyWith<$Res> {
  factory _$$_ResUrlVideoModelCopyWith(
          _$_ResUrlVideoModel value, $Res Function(_$_ResUrlVideoModel) then) =
      __$$_ResUrlVideoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ResMusicMetaModel? meta, DataUrlVideoModel? data});

  @override
  $ResMusicMetaModelCopyWith<$Res>? get meta;
  @override
  $DataUrlVideoModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ResUrlVideoModelCopyWithImpl<$Res>
    extends _$ResUrlVideoModelCopyWithImpl<$Res, _$_ResUrlVideoModel>
    implements _$$_ResUrlVideoModelCopyWith<$Res> {
  __$$_ResUrlVideoModelCopyWithImpl(
      _$_ResUrlVideoModel _value, $Res Function(_$_ResUrlVideoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ResUrlVideoModel(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ResMusicMetaModel?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataUrlVideoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResUrlVideoModel implements _ResUrlVideoModel {
  const _$_ResUrlVideoModel({this.meta, this.data});

  factory _$_ResUrlVideoModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResUrlVideoModelFromJson(json);

  @override
  final ResMusicMetaModel? meta;
  @override
  final DataUrlVideoModel? data;

  @override
  String toString() {
    return 'ResUrlVideoModel(meta: $meta, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResUrlVideoModel &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, meta, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResUrlVideoModelCopyWith<_$_ResUrlVideoModel> get copyWith =>
      __$$_ResUrlVideoModelCopyWithImpl<_$_ResUrlVideoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResUrlVideoModelToJson(
      this,
    );
  }
}

abstract class _ResUrlVideoModel implements ResUrlVideoModel {
  const factory _ResUrlVideoModel(
      {final ResMusicMetaModel? meta,
      final DataUrlVideoModel? data}) = _$_ResUrlVideoModel;

  factory _ResUrlVideoModel.fromJson(Map<String, dynamic> json) =
      _$_ResUrlVideoModel.fromJson;

  @override
  ResMusicMetaModel? get meta;
  @override
  DataUrlVideoModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ResUrlVideoModelCopyWith<_$_ResUrlVideoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DataUrlVideoModel _$DataUrlVideoModelFromJson(Map<String, dynamic> json) {
  return _DataUrlVideoModel.fromJson(json);
}

/// @nodoc
mixin _$DataUrlVideoModel {
  String? get url => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get thumbnails => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataUrlVideoModelCopyWith<DataUrlVideoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataUrlVideoModelCopyWith<$Res> {
  factory $DataUrlVideoModelCopyWith(
          DataUrlVideoModel value, $Res Function(DataUrlVideoModel) then) =
      _$DataUrlVideoModelCopyWithImpl<$Res, DataUrlVideoModel>;
  @useResult
  $Res call({String? url, String? title, String? thumbnails, String? duration});
}

/// @nodoc
class _$DataUrlVideoModelCopyWithImpl<$Res, $Val extends DataUrlVideoModel>
    implements $DataUrlVideoModelCopyWith<$Res> {
  _$DataUrlVideoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? title = freezed,
    Object? thumbnails = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnails: freezed == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataUrlVideoModelCopyWith<$Res>
    implements $DataUrlVideoModelCopyWith<$Res> {
  factory _$$_DataUrlVideoModelCopyWith(_$_DataUrlVideoModel value,
          $Res Function(_$_DataUrlVideoModel) then) =
      __$$_DataUrlVideoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, String? title, String? thumbnails, String? duration});
}

/// @nodoc
class __$$_DataUrlVideoModelCopyWithImpl<$Res>
    extends _$DataUrlVideoModelCopyWithImpl<$Res, _$_DataUrlVideoModel>
    implements _$$_DataUrlVideoModelCopyWith<$Res> {
  __$$_DataUrlVideoModelCopyWithImpl(
      _$_DataUrlVideoModel _value, $Res Function(_$_DataUrlVideoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? title = freezed,
    Object? thumbnails = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$_DataUrlVideoModel(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnails: freezed == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataUrlVideoModel implements _DataUrlVideoModel {
  const _$_DataUrlVideoModel(
      {this.url, this.title, this.thumbnails, this.duration});

  factory _$_DataUrlVideoModel.fromJson(Map<String, dynamic> json) =>
      _$$_DataUrlVideoModelFromJson(json);

  @override
  final String? url;
  @override
  final String? title;
  @override
  final String? thumbnails;
  @override
  final String? duration;

  @override
  String toString() {
    return 'DataUrlVideoModel(url: $url, title: $title, thumbnails: $thumbnails, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataUrlVideoModel &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnails, thumbnails) ||
                other.thumbnails == thumbnails) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, url, title, thumbnails, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataUrlVideoModelCopyWith<_$_DataUrlVideoModel> get copyWith =>
      __$$_DataUrlVideoModelCopyWithImpl<_$_DataUrlVideoModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataUrlVideoModelToJson(
      this,
    );
  }
}

abstract class _DataUrlVideoModel implements DataUrlVideoModel {
  const factory _DataUrlVideoModel(
      {final String? url,
      final String? title,
      final String? thumbnails,
      final String? duration}) = _$_DataUrlVideoModel;

  factory _DataUrlVideoModel.fromJson(Map<String, dynamic> json) =
      _$_DataUrlVideoModel.fromJson;

  @override
  String? get url;
  @override
  String? get title;
  @override
  String? get thumbnails;
  @override
  String? get duration;
  @override
  @JsonKey(ignore: true)
  _$$_DataUrlVideoModelCopyWith<_$_DataUrlVideoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
