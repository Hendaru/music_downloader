// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_version_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResVersionModel _$ResVersionModelFromJson(Map<String, dynamic> json) {
  return _ResVersionModel.fromJson(json);
}

/// @nodoc
mixin _$ResVersionModel {
  ResMusicMetaModel? get meta => throw _privateConstructorUsedError;
  DataVersionModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResVersionModelCopyWith<ResVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResVersionModelCopyWith<$Res> {
  factory $ResVersionModelCopyWith(
          ResVersionModel value, $Res Function(ResVersionModel) then) =
      _$ResVersionModelCopyWithImpl<$Res, ResVersionModel>;
  @useResult
  $Res call({ResMusicMetaModel? meta, DataVersionModel? data});

  $ResMusicMetaModelCopyWith<$Res>? get meta;
  $DataVersionModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$ResVersionModelCopyWithImpl<$Res, $Val extends ResVersionModel>
    implements $ResVersionModelCopyWith<$Res> {
  _$ResVersionModelCopyWithImpl(this._value, this._then);

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
              as DataVersionModel?,
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
  $DataVersionModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataVersionModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ResVersionModelCopyWith<$Res>
    implements $ResVersionModelCopyWith<$Res> {
  factory _$$_ResVersionModelCopyWith(
          _$_ResVersionModel value, $Res Function(_$_ResVersionModel) then) =
      __$$_ResVersionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ResMusicMetaModel? meta, DataVersionModel? data});

  @override
  $ResMusicMetaModelCopyWith<$Res>? get meta;
  @override
  $DataVersionModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ResVersionModelCopyWithImpl<$Res>
    extends _$ResVersionModelCopyWithImpl<$Res, _$_ResVersionModel>
    implements _$$_ResVersionModelCopyWith<$Res> {
  __$$_ResVersionModelCopyWithImpl(
      _$_ResVersionModel _value, $Res Function(_$_ResVersionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ResVersionModel(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ResMusicMetaModel?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataVersionModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResVersionModel implements _ResVersionModel {
  const _$_ResVersionModel({this.meta, this.data});

  factory _$_ResVersionModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResVersionModelFromJson(json);

  @override
  final ResMusicMetaModel? meta;
  @override
  final DataVersionModel? data;

  @override
  String toString() {
    return 'ResVersionModel(meta: $meta, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResVersionModel &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, meta, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResVersionModelCopyWith<_$_ResVersionModel> get copyWith =>
      __$$_ResVersionModelCopyWithImpl<_$_ResVersionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResVersionModelToJson(
      this,
    );
  }
}

abstract class _ResVersionModel implements ResVersionModel {
  const factory _ResVersionModel(
      {final ResMusicMetaModel? meta,
      final DataVersionModel? data}) = _$_ResVersionModel;

  factory _ResVersionModel.fromJson(Map<String, dynamic> json) =
      _$_ResVersionModel.fromJson;

  @override
  ResMusicMetaModel? get meta;
  @override
  DataVersionModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ResVersionModelCopyWith<_$_ResVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DataVersionModel _$DataVersionModelFromJson(Map<String, dynamic> json) {
  return _DataVersionModel.fromJson(json);
}

/// @nodoc
mixin _$DataVersionModel {
  @JsonKey(name: "name_version")
  String? get nameVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataVersionModelCopyWith<DataVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataVersionModelCopyWith<$Res> {
  factory $DataVersionModelCopyWith(
          DataVersionModel value, $Res Function(DataVersionModel) then) =
      _$DataVersionModelCopyWithImpl<$Res, DataVersionModel>;
  @useResult
  $Res call({@JsonKey(name: "name_version") String? nameVersion});
}

/// @nodoc
class _$DataVersionModelCopyWithImpl<$Res, $Val extends DataVersionModel>
    implements $DataVersionModelCopyWith<$Res> {
  _$DataVersionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameVersion = freezed,
  }) {
    return _then(_value.copyWith(
      nameVersion: freezed == nameVersion
          ? _value.nameVersion
          : nameVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataVersionModelCopyWith<$Res>
    implements $DataVersionModelCopyWith<$Res> {
  factory _$$_DataVersionModelCopyWith(
          _$_DataVersionModel value, $Res Function(_$_DataVersionModel) then) =
      __$$_DataVersionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "name_version") String? nameVersion});
}

/// @nodoc
class __$$_DataVersionModelCopyWithImpl<$Res>
    extends _$DataVersionModelCopyWithImpl<$Res, _$_DataVersionModel>
    implements _$$_DataVersionModelCopyWith<$Res> {
  __$$_DataVersionModelCopyWithImpl(
      _$_DataVersionModel _value, $Res Function(_$_DataVersionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameVersion = freezed,
  }) {
    return _then(_$_DataVersionModel(
      nameVersion: freezed == nameVersion
          ? _value.nameVersion
          : nameVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataVersionModel implements _DataVersionModel {
  const _$_DataVersionModel({@JsonKey(name: "name_version") this.nameVersion});

  factory _$_DataVersionModel.fromJson(Map<String, dynamic> json) =>
      _$$_DataVersionModelFromJson(json);

  @override
  @JsonKey(name: "name_version")
  final String? nameVersion;

  @override
  String toString() {
    return 'DataVersionModel(nameVersion: $nameVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataVersionModel &&
            (identical(other.nameVersion, nameVersion) ||
                other.nameVersion == nameVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nameVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataVersionModelCopyWith<_$_DataVersionModel> get copyWith =>
      __$$_DataVersionModelCopyWithImpl<_$_DataVersionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataVersionModelToJson(
      this,
    );
  }
}

abstract class _DataVersionModel implements DataVersionModel {
  const factory _DataVersionModel(
          {@JsonKey(name: "name_version") final String? nameVersion}) =
      _$_DataVersionModel;

  factory _DataVersionModel.fromJson(Map<String, dynamic> json) =
      _$_DataVersionModel.fromJson;

  @override
  @JsonKey(name: "name_version")
  String? get nameVersion;
  @override
  @JsonKey(ignore: true)
  _$$_DataVersionModelCopyWith<_$_DataVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
