// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_version_download_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResVersionDownloadModel _$ResVersionDownloadModelFromJson(
    Map<String, dynamic> json) {
  return _ResVersionModel.fromJson(json);
}

/// @nodoc
mixin _$ResVersionDownloadModel {
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  List<DataVersionDownloadModel>? get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResVersionDownloadModelCopyWith<ResVersionDownloadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResVersionDownloadModelCopyWith<$Res> {
  factory $ResVersionDownloadModelCopyWith(ResVersionDownloadModel value,
          $Res Function(ResVersionDownloadModel) then) =
      _$ResVersionDownloadModelCopyWithImpl<$Res, ResVersionDownloadModel>;
  @useResult
  $Res call({String? message, int? code, List<DataVersionDownloadModel>? data});
}

/// @nodoc
class _$ResVersionDownloadModelCopyWithImpl<$Res,
        $Val extends ResVersionDownloadModel>
    implements $ResVersionDownloadModelCopyWith<$Res> {
  _$ResVersionDownloadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataVersionDownloadModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResVersionModelCopyWith<$Res>
    implements $ResVersionDownloadModelCopyWith<$Res> {
  factory _$$_ResVersionModelCopyWith(
          _$_ResVersionModel value, $Res Function(_$_ResVersionModel) then) =
      __$$_ResVersionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int? code, List<DataVersionDownloadModel>? data});
}

/// @nodoc
class __$$_ResVersionModelCopyWithImpl<$Res>
    extends _$ResVersionDownloadModelCopyWithImpl<$Res, _$_ResVersionModel>
    implements _$$_ResVersionModelCopyWith<$Res> {
  __$$_ResVersionModelCopyWithImpl(
      _$_ResVersionModel _value, $Res Function(_$_ResVersionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ResVersionModel(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataVersionDownloadModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResVersionModel implements _ResVersionModel {
  const _$_ResVersionModel(
      {this.message, this.code, final List<DataVersionDownloadModel>? data})
      : _data = data;

  factory _$_ResVersionModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResVersionModelFromJson(json);

  @override
  final String? message;
  @override
  final int? code;
  final List<DataVersionDownloadModel>? _data;
  @override
  List<DataVersionDownloadModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResVersionDownloadModel(message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResVersionModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, code, const DeepCollectionEquality().hash(_data));

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

abstract class _ResVersionModel implements ResVersionDownloadModel {
  const factory _ResVersionModel(
      {final String? message,
      final int? code,
      final List<DataVersionDownloadModel>? data}) = _$_ResVersionModel;

  factory _ResVersionModel.fromJson(Map<String, dynamic> json) =
      _$_ResVersionModel.fromJson;

  @override
  String? get message;
  @override
  int? get code;
  @override
  List<DataVersionDownloadModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ResVersionModelCopyWith<_$_ResVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DataVersionDownloadModel _$DataVersionDownloadModelFromJson(
    Map<String, dynamic> json) {
  return _DataVersionDownloadModel.fromJson(json);
}

/// @nodoc
mixin _$DataVersionDownloadModel {
  @JsonKey(name: "name")
  String? get nameVersion => throw _privateConstructorUsedError;
  @JsonKey(name: "app_name")
  String? get appName => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataVersionDownloadModelCopyWith<DataVersionDownloadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataVersionDownloadModelCopyWith<$Res> {
  factory $DataVersionDownloadModelCopyWith(DataVersionDownloadModel value,
          $Res Function(DataVersionDownloadModel) then) =
      _$DataVersionDownloadModelCopyWithImpl<$Res, DataVersionDownloadModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? nameVersion,
      @JsonKey(name: "app_name") String? appName,
      @JsonKey(name: "id") int? id});
}

/// @nodoc
class _$DataVersionDownloadModelCopyWithImpl<$Res,
        $Val extends DataVersionDownloadModel>
    implements $DataVersionDownloadModelCopyWith<$Res> {
  _$DataVersionDownloadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameVersion = freezed,
    Object? appName = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      nameVersion: freezed == nameVersion
          ? _value.nameVersion
          : nameVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataVersionDownloadModelCopyWith<$Res>
    implements $DataVersionDownloadModelCopyWith<$Res> {
  factory _$$_DataVersionDownloadModelCopyWith(
          _$_DataVersionDownloadModel value,
          $Res Function(_$_DataVersionDownloadModel) then) =
      __$$_DataVersionDownloadModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? nameVersion,
      @JsonKey(name: "app_name") String? appName,
      @JsonKey(name: "id") int? id});
}

/// @nodoc
class __$$_DataVersionDownloadModelCopyWithImpl<$Res>
    extends _$DataVersionDownloadModelCopyWithImpl<$Res,
        _$_DataVersionDownloadModel>
    implements _$$_DataVersionDownloadModelCopyWith<$Res> {
  __$$_DataVersionDownloadModelCopyWithImpl(_$_DataVersionDownloadModel _value,
      $Res Function(_$_DataVersionDownloadModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameVersion = freezed,
    Object? appName = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_DataVersionDownloadModel(
      nameVersion: freezed == nameVersion
          ? _value.nameVersion
          : nameVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataVersionDownloadModel implements _DataVersionDownloadModel {
  const _$_DataVersionDownloadModel(
      {@JsonKey(name: "name") this.nameVersion,
      @JsonKey(name: "app_name") this.appName,
      @JsonKey(name: "id") this.id});

  factory _$_DataVersionDownloadModel.fromJson(Map<String, dynamic> json) =>
      _$$_DataVersionDownloadModelFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? nameVersion;
  @override
  @JsonKey(name: "app_name")
  final String? appName;
  @override
  @JsonKey(name: "id")
  final int? id;

  @override
  String toString() {
    return 'DataVersionDownloadModel(nameVersion: $nameVersion, appName: $appName, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataVersionDownloadModel &&
            (identical(other.nameVersion, nameVersion) ||
                other.nameVersion == nameVersion) &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nameVersion, appName, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataVersionDownloadModelCopyWith<_$_DataVersionDownloadModel>
      get copyWith => __$$_DataVersionDownloadModelCopyWithImpl<
          _$_DataVersionDownloadModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataVersionDownloadModelToJson(
      this,
    );
  }
}

abstract class _DataVersionDownloadModel implements DataVersionDownloadModel {
  const factory _DataVersionDownloadModel(
      {@JsonKey(name: "name") final String? nameVersion,
      @JsonKey(name: "app_name") final String? appName,
      @JsonKey(name: "id") final int? id}) = _$_DataVersionDownloadModel;

  factory _DataVersionDownloadModel.fromJson(Map<String, dynamic> json) =
      _$_DataVersionDownloadModel.fromJson;

  @override
  @JsonKey(name: "name")
  String? get nameVersion;
  @override
  @JsonKey(name: "app_name")
  String? get appName;
  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$_DataVersionDownloadModelCopyWith<_$_DataVersionDownloadModel>
      get copyWith => throw _privateConstructorUsedError;
}
