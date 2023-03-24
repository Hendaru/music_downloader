// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DownloadProgressModel _$DownloadProgressModelFromJson(
    Map<String, dynamic> json) {
  return _DownloadProgressModel.fromJson(json);
}

/// @nodoc
mixin _$DownloadProgressModel {
  bool get completeDownload => throw _privateConstructorUsedError;
  double get progresDownload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DownloadProgressModelCopyWith<DownloadProgressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadProgressModelCopyWith<$Res> {
  factory $DownloadProgressModelCopyWith(DownloadProgressModel value,
          $Res Function(DownloadProgressModel) then) =
      _$DownloadProgressModelCopyWithImpl<$Res, DownloadProgressModel>;
  @useResult
  $Res call({bool completeDownload, double progresDownload});
}

/// @nodoc
class _$DownloadProgressModelCopyWithImpl<$Res,
        $Val extends DownloadProgressModel>
    implements $DownloadProgressModelCopyWith<$Res> {
  _$DownloadProgressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completeDownload = null,
    Object? progresDownload = null,
  }) {
    return _then(_value.copyWith(
      completeDownload: null == completeDownload
          ? _value.completeDownload
          : completeDownload // ignore: cast_nullable_to_non_nullable
              as bool,
      progresDownload: null == progresDownload
          ? _value.progresDownload
          : progresDownload // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DownloadProgressModelCopyWith<$Res>
    implements $DownloadProgressModelCopyWith<$Res> {
  factory _$$_DownloadProgressModelCopyWith(_$_DownloadProgressModel value,
          $Res Function(_$_DownloadProgressModel) then) =
      __$$_DownloadProgressModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool completeDownload, double progresDownload});
}

/// @nodoc
class __$$_DownloadProgressModelCopyWithImpl<$Res>
    extends _$DownloadProgressModelCopyWithImpl<$Res, _$_DownloadProgressModel>
    implements _$$_DownloadProgressModelCopyWith<$Res> {
  __$$_DownloadProgressModelCopyWithImpl(_$_DownloadProgressModel _value,
      $Res Function(_$_DownloadProgressModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completeDownload = null,
    Object? progresDownload = null,
  }) {
    return _then(_$_DownloadProgressModel(
      completeDownload: null == completeDownload
          ? _value.completeDownload
          : completeDownload // ignore: cast_nullable_to_non_nullable
              as bool,
      progresDownload: null == progresDownload
          ? _value.progresDownload
          : progresDownload // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DownloadProgressModel implements _DownloadProgressModel {
  _$_DownloadProgressModel(
      {this.completeDownload = false, this.progresDownload = 0.0});

  factory _$_DownloadProgressModel.fromJson(Map<String, dynamic> json) =>
      _$$_DownloadProgressModelFromJson(json);

  @override
  @JsonKey()
  final bool completeDownload;
  @override
  @JsonKey()
  final double progresDownload;

  @override
  String toString() {
    return 'DownloadProgressModel(completeDownload: $completeDownload, progresDownload: $progresDownload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadProgressModel &&
            (identical(other.completeDownload, completeDownload) ||
                other.completeDownload == completeDownload) &&
            (identical(other.progresDownload, progresDownload) ||
                other.progresDownload == progresDownload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, completeDownload, progresDownload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadProgressModelCopyWith<_$_DownloadProgressModel> get copyWith =>
      __$$_DownloadProgressModelCopyWithImpl<_$_DownloadProgressModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DownloadProgressModelToJson(
      this,
    );
  }
}

abstract class _DownloadProgressModel implements DownloadProgressModel {
  factory _DownloadProgressModel(
      {final bool completeDownload,
      final double progresDownload}) = _$_DownloadProgressModel;

  factory _DownloadProgressModel.fromJson(Map<String, dynamic> json) =
      _$_DownloadProgressModel.fromJson;

  @override
  bool get completeDownload;
  @override
  double get progresDownload;
  @override
  @JsonKey(ignore: true)
  _$$_DownloadProgressModelCopyWith<_$_DownloadProgressModel> get copyWith =>
      throw _privateConstructorUsedError;
}
