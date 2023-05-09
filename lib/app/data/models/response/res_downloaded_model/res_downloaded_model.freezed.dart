// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_downloaded_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResDownloadedModel _$ResDownloadedModelFromJson(Map<String, dynamic> json) {
  return _ResDownloadedModel.fromJson(json);
}

/// @nodoc
mixin _$ResDownloadedModel {
  String? get id => throw _privateConstructorUsedError;
  String? get idLike => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResDownloadedModelCopyWith<ResDownloadedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResDownloadedModelCopyWith<$Res> {
  factory $ResDownloadedModelCopyWith(
          ResDownloadedModel value, $Res Function(ResDownloadedModel) then) =
      _$ResDownloadedModelCopyWithImpl<$Res, ResDownloadedModel>;
  @useResult
  $Res call(
      {String? id,
      String? idLike,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "image") String? image,
      String? duration,
      String? path});
}

/// @nodoc
class _$ResDownloadedModelCopyWithImpl<$Res, $Val extends ResDownloadedModel>
    implements $ResDownloadedModelCopyWith<$Res> {
  _$ResDownloadedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idLike = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? duration = freezed,
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idLike: freezed == idLike
          ? _value.idLike
          : idLike // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResDownloadedModelCopyWith<$Res>
    implements $ResDownloadedModelCopyWith<$Res> {
  factory _$$_ResDownloadedModelCopyWith(_$_ResDownloadedModel value,
          $Res Function(_$_ResDownloadedModel) then) =
      __$$_ResDownloadedModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? idLike,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "image") String? image,
      String? duration,
      String? path});
}

/// @nodoc
class __$$_ResDownloadedModelCopyWithImpl<$Res>
    extends _$ResDownloadedModelCopyWithImpl<$Res, _$_ResDownloadedModel>
    implements _$$_ResDownloadedModelCopyWith<$Res> {
  __$$_ResDownloadedModelCopyWithImpl(
      _$_ResDownloadedModel _value, $Res Function(_$_ResDownloadedModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idLike = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? duration = freezed,
    Object? path = freezed,
  }) {
    return _then(_$_ResDownloadedModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idLike: freezed == idLike
          ? _value.idLike
          : idLike // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResDownloadedModel implements _ResDownloadedModel {
  _$_ResDownloadedModel(
      {this.id = '',
      this.idLike = '',
      @JsonKey(name: "title") this.title = '',
      @JsonKey(name: "image") this.image = '',
      this.duration = '',
      this.path = ''});

  factory _$_ResDownloadedModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResDownloadedModelFromJson(json);

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey()
  final String? idLike;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey()
  final String? duration;
  @override
  @JsonKey()
  final String? path;

  @override
  String toString() {
    return 'ResDownloadedModel(id: $id, idLike: $idLike, title: $title, image: $image, duration: $duration, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResDownloadedModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idLike, idLike) || other.idLike == idLike) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, idLike, title, image, duration, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResDownloadedModelCopyWith<_$_ResDownloadedModel> get copyWith =>
      __$$_ResDownloadedModelCopyWithImpl<_$_ResDownloadedModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResDownloadedModelToJson(
      this,
    );
  }
}

abstract class _ResDownloadedModel implements ResDownloadedModel {
  factory _ResDownloadedModel(
      {final String? id,
      final String? idLike,
      @JsonKey(name: "title") final String? title,
      @JsonKey(name: "image") final String? image,
      final String? duration,
      final String? path}) = _$_ResDownloadedModel;

  factory _ResDownloadedModel.fromJson(Map<String, dynamic> json) =
      _$_ResDownloadedModel.fromJson;

  @override
  String? get id;
  @override
  String? get idLike;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  String? get duration;
  @override
  String? get path;
  @override
  @JsonKey(ignore: true)
  _$$_ResDownloadedModelCopyWith<_$_ResDownloadedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
