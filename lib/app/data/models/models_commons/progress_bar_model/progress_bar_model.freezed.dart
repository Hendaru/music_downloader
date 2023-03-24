// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_bar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProgressBarModel _$ProgressBarModelFromJson(Map<String, dynamic> json) {
  return _ProgressBarModel.fromJson(json);
}

/// @nodoc
mixin _$ProgressBarModel {
  Duration get current => throw _privateConstructorUsedError;
  Duration get buffered => throw _privateConstructorUsedError;
  Duration get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressBarModelCopyWith<ProgressBarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressBarModelCopyWith<$Res> {
  factory $ProgressBarModelCopyWith(
          ProgressBarModel value, $Res Function(ProgressBarModel) then) =
      _$ProgressBarModelCopyWithImpl<$Res, ProgressBarModel>;
  @useResult
  $Res call({Duration current, Duration buffered, Duration total});
}

/// @nodoc
class _$ProgressBarModelCopyWithImpl<$Res, $Val extends ProgressBarModel>
    implements $ProgressBarModelCopyWith<$Res> {
  _$ProgressBarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? buffered = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Duration,
      buffered: null == buffered
          ? _value.buffered
          : buffered // ignore: cast_nullable_to_non_nullable
              as Duration,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProgressBarModelCopyWith<$Res>
    implements $ProgressBarModelCopyWith<$Res> {
  factory _$$_ProgressBarModelCopyWith(
          _$_ProgressBarModel value, $Res Function(_$_ProgressBarModel) then) =
      __$$_ProgressBarModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration current, Duration buffered, Duration total});
}

/// @nodoc
class __$$_ProgressBarModelCopyWithImpl<$Res>
    extends _$ProgressBarModelCopyWithImpl<$Res, _$_ProgressBarModel>
    implements _$$_ProgressBarModelCopyWith<$Res> {
  __$$_ProgressBarModelCopyWithImpl(
      _$_ProgressBarModel _value, $Res Function(_$_ProgressBarModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? buffered = null,
    Object? total = null,
  }) {
    return _then(_$_ProgressBarModel(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Duration,
      buffered: null == buffered
          ? _value.buffered
          : buffered // ignore: cast_nullable_to_non_nullable
              as Duration,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProgressBarModel implements _ProgressBarModel {
  _$_ProgressBarModel(
      {this.current = Duration.zero,
      this.buffered = Duration.zero,
      this.total = Duration.zero});

  factory _$_ProgressBarModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProgressBarModelFromJson(json);

  @override
  @JsonKey()
  final Duration current;
  @override
  @JsonKey()
  final Duration buffered;
  @override
  @JsonKey()
  final Duration total;

  @override
  String toString() {
    return 'ProgressBarModel(current: $current, buffered: $buffered, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgressBarModel &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.buffered, buffered) ||
                other.buffered == buffered) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, current, buffered, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgressBarModelCopyWith<_$_ProgressBarModel> get copyWith =>
      __$$_ProgressBarModelCopyWithImpl<_$_ProgressBarModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProgressBarModelToJson(
      this,
    );
  }
}

abstract class _ProgressBarModel implements ProgressBarModel {
  factory _ProgressBarModel(
      {final Duration current,
      final Duration buffered,
      final Duration total}) = _$_ProgressBarModel;

  factory _ProgressBarModel.fromJson(Map<String, dynamic> json) =
      _$_ProgressBarModel.fromJson;

  @override
  Duration get current;
  @override
  Duration get buffered;
  @override
  Duration get total;
  @override
  @JsonKey(ignore: true)
  _$$_ProgressBarModelCopyWith<_$_ProgressBarModel> get copyWith =>
      throw _privateConstructorUsedError;
}
