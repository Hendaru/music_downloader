// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResError _$ResErrorFromJson(Map<String, dynamic> json) {
  return _ResError.fromJson(json);
}

/// @nodoc
mixin _$ResError {
  int get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResErrorCopyWith<ResError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResErrorCopyWith<$Res> {
  factory $ResErrorCopyWith(ResError value, $Res Function(ResError) then) =
      _$ResErrorCopyWithImpl<$Res, ResError>;
  @useResult
  $Res call({int status, String message});
}

/// @nodoc
class _$ResErrorCopyWithImpl<$Res, $Val extends ResError>
    implements $ResErrorCopyWith<$Res> {
  _$ResErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResErrorCopyWith<$Res> implements $ResErrorCopyWith<$Res> {
  factory _$$_ResErrorCopyWith(
          _$_ResError value, $Res Function(_$_ResError) then) =
      __$$_ResErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, String message});
}

/// @nodoc
class __$$_ResErrorCopyWithImpl<$Res>
    extends _$ResErrorCopyWithImpl<$Res, _$_ResError>
    implements _$$_ResErrorCopyWith<$Res> {
  __$$_ResErrorCopyWithImpl(
      _$_ResError _value, $Res Function(_$_ResError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$_ResError(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResError implements _ResError {
  const _$_ResError({this.status = 909, this.message = ''});

  factory _$_ResError.fromJson(Map<String, dynamic> json) =>
      _$$_ResErrorFromJson(json);

  @override
  @JsonKey()
  final int status;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ResError(status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResError &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResErrorCopyWith<_$_ResError> get copyWith =>
      __$$_ResErrorCopyWithImpl<_$_ResError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResErrorToJson(
      this,
    );
  }
}

abstract class _ResError implements ResError {
  const factory _ResError({final int status, final String message}) =
      _$_ResError;

  factory _ResError.fromJson(Map<String, dynamic> json) = _$_ResError.fromJson;

  @override
  int get status;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ResErrorCopyWith<_$_ResError> get copyWith =>
      throw _privateConstructorUsedError;
}
