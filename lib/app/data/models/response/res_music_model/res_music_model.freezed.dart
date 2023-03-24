// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_music_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResMusicModel _$ResMusicModelFromJson(Map<String, dynamic> json) {
  return _ResMusicModel.fromJson(json);
}

/// @nodoc
mixin _$ResMusicModel {
  ResMusicMetaModel? get meta => throw _privateConstructorUsedError;
  List<ResMusicDataModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResMusicModelCopyWith<ResMusicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResMusicModelCopyWith<$Res> {
  factory $ResMusicModelCopyWith(
          ResMusicModel value, $Res Function(ResMusicModel) then) =
      _$ResMusicModelCopyWithImpl<$Res, ResMusicModel>;
  @useResult
  $Res call({ResMusicMetaModel? meta, List<ResMusicDataModel>? data});

  $ResMusicMetaModelCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ResMusicModelCopyWithImpl<$Res, $Val extends ResMusicModel>
    implements $ResMusicModelCopyWith<$Res> {
  _$ResMusicModelCopyWithImpl(this._value, this._then);

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
              as List<ResMusicDataModel>?,
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
}

/// @nodoc
abstract class _$$_ResMusicModelCopyWith<$Res>
    implements $ResMusicModelCopyWith<$Res> {
  factory _$$_ResMusicModelCopyWith(
          _$_ResMusicModel value, $Res Function(_$_ResMusicModel) then) =
      __$$_ResMusicModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ResMusicMetaModel? meta, List<ResMusicDataModel>? data});

  @override
  $ResMusicMetaModelCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$_ResMusicModelCopyWithImpl<$Res>
    extends _$ResMusicModelCopyWithImpl<$Res, _$_ResMusicModel>
    implements _$$_ResMusicModelCopyWith<$Res> {
  __$$_ResMusicModelCopyWithImpl(
      _$_ResMusicModel _value, $Res Function(_$_ResMusicModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ResMusicModel(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ResMusicMetaModel?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ResMusicDataModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResMusicModel implements _ResMusicModel {
  _$_ResMusicModel({this.meta, final List<ResMusicDataModel>? data = const []})
      : _data = data;

  factory _$_ResMusicModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResMusicModelFromJson(json);

  @override
  final ResMusicMetaModel? meta;
  final List<ResMusicDataModel>? _data;
  @override
  @JsonKey()
  List<ResMusicDataModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResMusicModel(meta: $meta, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResMusicModel &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, meta, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResMusicModelCopyWith<_$_ResMusicModel> get copyWith =>
      __$$_ResMusicModelCopyWithImpl<_$_ResMusicModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResMusicModelToJson(
      this,
    );
  }
}

abstract class _ResMusicModel implements ResMusicModel {
  factory _ResMusicModel(
      {final ResMusicMetaModel? meta,
      final List<ResMusicDataModel>? data}) = _$_ResMusicModel;

  factory _ResMusicModel.fromJson(Map<String, dynamic> json) =
      _$_ResMusicModel.fromJson;

  @override
  ResMusicMetaModel? get meta;
  @override
  List<ResMusicDataModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ResMusicModelCopyWith<_$_ResMusicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ResMusicMetaModel _$ResMusicMetaModelFromJson(Map<String, dynamic> json) {
  return _ResMusicMetaModel.fromJson(json);
}

/// @nodoc
mixin _$ResMusicMetaModel {
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResMusicMetaModelCopyWith<ResMusicMetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResMusicMetaModelCopyWith<$Res> {
  factory $ResMusicMetaModelCopyWith(
          ResMusicMetaModel value, $Res Function(ResMusicMetaModel) then) =
      _$ResMusicMetaModelCopyWithImpl<$Res, ResMusicMetaModel>;
  @useResult
  $Res call({String? message, int? code, String? status});
}

/// @nodoc
class _$ResMusicMetaModelCopyWithImpl<$Res, $Val extends ResMusicMetaModel>
    implements $ResMusicMetaModelCopyWith<$Res> {
  _$ResMusicMetaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? status = freezed,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResMusicMetaModelCopyWith<$Res>
    implements $ResMusicMetaModelCopyWith<$Res> {
  factory _$$_ResMusicMetaModelCopyWith(_$_ResMusicMetaModel value,
          $Res Function(_$_ResMusicMetaModel) then) =
      __$$_ResMusicMetaModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int? code, String? status});
}

/// @nodoc
class __$$_ResMusicMetaModelCopyWithImpl<$Res>
    extends _$ResMusicMetaModelCopyWithImpl<$Res, _$_ResMusicMetaModel>
    implements _$$_ResMusicMetaModelCopyWith<$Res> {
  __$$_ResMusicMetaModelCopyWithImpl(
      _$_ResMusicMetaModel _value, $Res Function(_$_ResMusicMetaModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ResMusicMetaModel(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResMusicMetaModel implements _ResMusicMetaModel {
  _$_ResMusicMetaModel({this.message, this.code, this.status});

  factory _$_ResMusicMetaModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResMusicMetaModelFromJson(json);

  @override
  final String? message;
  @override
  final int? code;
  @override
  final String? status;

  @override
  String toString() {
    return 'ResMusicMetaModel(message: $message, code: $code, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResMusicMetaModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, code, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResMusicMetaModelCopyWith<_$_ResMusicMetaModel> get copyWith =>
      __$$_ResMusicMetaModelCopyWithImpl<_$_ResMusicMetaModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResMusicMetaModelToJson(
      this,
    );
  }
}

abstract class _ResMusicMetaModel implements ResMusicMetaModel {
  factory _ResMusicMetaModel(
      {final String? message,
      final int? code,
      final String? status}) = _$_ResMusicMetaModel;

  factory _ResMusicMetaModel.fromJson(Map<String, dynamic> json) =
      _$_ResMusicMetaModel.fromJson;

  @override
  String? get message;
  @override
  int? get code;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_ResMusicMetaModelCopyWith<_$_ResMusicMetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ResMusicDataModel _$ResMusicDataModelFromJson(Map<String, dynamic> json) {
  return _ResMusicDataModel.fromJson(json);
}

/// @nodoc
mixin _$ResMusicDataModel {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "id_artist")
  String? get idArtist => throw _privateConstructorUsedError;
  @JsonKey(name: "id_genre")
  String? get idGenre => throw _privateConstructorUsedError;
  String? get idPlayList => throw _privateConstructorUsedError;
  String? get idLike => throw _privateConstructorUsedError;
  @JsonKey(name: "judul_lagu")
  String? get judulLagu => throw _privateConstructorUsedError;
  @JsonKey(name: "image_lagu")
  String? get imageLagu => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: "asset_lagu")
  String? get assetLagu => throw _privateConstructorUsedError;
  String? get localLagu => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResMusicDataModelCopyWith<ResMusicDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResMusicDataModelCopyWith<$Res> {
  factory $ResMusicDataModelCopyWith(
          ResMusicDataModel value, $Res Function(ResMusicDataModel) then) =
      _$ResMusicDataModelCopyWithImpl<$Res, ResMusicDataModel>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: "id_artist") String? idArtist,
      @JsonKey(name: "id_genre") String? idGenre,
      String? idPlayList,
      String? idLike,
      @JsonKey(name: "judul_lagu") String? judulLagu,
      @JsonKey(name: "image_lagu") String? imageLagu,
      String? duration,
      @JsonKey(name: "asset_lagu") String? assetLagu,
      String? localLagu,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt});
}

/// @nodoc
class _$ResMusicDataModelCopyWithImpl<$Res, $Val extends ResMusicDataModel>
    implements $ResMusicDataModelCopyWith<$Res> {
  _$ResMusicDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idArtist = freezed,
    Object? idGenre = freezed,
    Object? idPlayList = freezed,
    Object? idLike = freezed,
    Object? judulLagu = freezed,
    Object? imageLagu = freezed,
    Object? duration = freezed,
    Object? assetLagu = freezed,
    Object? localLagu = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idArtist: freezed == idArtist
          ? _value.idArtist
          : idArtist // ignore: cast_nullable_to_non_nullable
              as String?,
      idGenre: freezed == idGenre
          ? _value.idGenre
          : idGenre // ignore: cast_nullable_to_non_nullable
              as String?,
      idPlayList: freezed == idPlayList
          ? _value.idPlayList
          : idPlayList // ignore: cast_nullable_to_non_nullable
              as String?,
      idLike: freezed == idLike
          ? _value.idLike
          : idLike // ignore: cast_nullable_to_non_nullable
              as String?,
      judulLagu: freezed == judulLagu
          ? _value.judulLagu
          : judulLagu // ignore: cast_nullable_to_non_nullable
              as String?,
      imageLagu: freezed == imageLagu
          ? _value.imageLagu
          : imageLagu // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      assetLagu: freezed == assetLagu
          ? _value.assetLagu
          : assetLagu // ignore: cast_nullable_to_non_nullable
              as String?,
      localLagu: freezed == localLagu
          ? _value.localLagu
          : localLagu // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResMusicDataModelCopyWith<$Res>
    implements $ResMusicDataModelCopyWith<$Res> {
  factory _$$_ResMusicDataModelCopyWith(_$_ResMusicDataModel value,
          $Res Function(_$_ResMusicDataModel) then) =
      __$$_ResMusicDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: "id_artist") String? idArtist,
      @JsonKey(name: "id_genre") String? idGenre,
      String? idPlayList,
      String? idLike,
      @JsonKey(name: "judul_lagu") String? judulLagu,
      @JsonKey(name: "image_lagu") String? imageLagu,
      String? duration,
      @JsonKey(name: "asset_lagu") String? assetLagu,
      String? localLagu,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt});
}

/// @nodoc
class __$$_ResMusicDataModelCopyWithImpl<$Res>
    extends _$ResMusicDataModelCopyWithImpl<$Res, _$_ResMusicDataModel>
    implements _$$_ResMusicDataModelCopyWith<$Res> {
  __$$_ResMusicDataModelCopyWithImpl(
      _$_ResMusicDataModel _value, $Res Function(_$_ResMusicDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idArtist = freezed,
    Object? idGenre = freezed,
    Object? idPlayList = freezed,
    Object? idLike = freezed,
    Object? judulLagu = freezed,
    Object? imageLagu = freezed,
    Object? duration = freezed,
    Object? assetLagu = freezed,
    Object? localLagu = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_ResMusicDataModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idArtist: freezed == idArtist
          ? _value.idArtist
          : idArtist // ignore: cast_nullable_to_non_nullable
              as String?,
      idGenre: freezed == idGenre
          ? _value.idGenre
          : idGenre // ignore: cast_nullable_to_non_nullable
              as String?,
      idPlayList: freezed == idPlayList
          ? _value.idPlayList
          : idPlayList // ignore: cast_nullable_to_non_nullable
              as String?,
      idLike: freezed == idLike
          ? _value.idLike
          : idLike // ignore: cast_nullable_to_non_nullable
              as String?,
      judulLagu: freezed == judulLagu
          ? _value.judulLagu
          : judulLagu // ignore: cast_nullable_to_non_nullable
              as String?,
      imageLagu: freezed == imageLagu
          ? _value.imageLagu
          : imageLagu // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      assetLagu: freezed == assetLagu
          ? _value.assetLagu
          : assetLagu // ignore: cast_nullable_to_non_nullable
              as String?,
      localLagu: freezed == localLagu
          ? _value.localLagu
          : localLagu // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResMusicDataModel implements _ResMusicDataModel {
  _$_ResMusicDataModel(
      {this.id = '',
      @JsonKey(name: "id_artist") this.idArtist = '',
      @JsonKey(name: "id_genre") this.idGenre = '',
      this.idPlayList = '',
      this.idLike = '',
      @JsonKey(name: "judul_lagu") this.judulLagu = '',
      @JsonKey(name: "image_lagu") this.imageLagu = '',
      this.duration = '',
      @JsonKey(name: "asset_lagu") this.assetLagu = '',
      this.localLagu = '',
      @JsonKey(name: "created_at") this.createdAt = '',
      @JsonKey(name: "updated_at") this.updatedAt = ''});

  factory _$_ResMusicDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResMusicDataModelFromJson(json);

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey(name: "id_artist")
  final String? idArtist;
  @override
  @JsonKey(name: "id_genre")
  final String? idGenre;
  @override
  @JsonKey()
  final String? idPlayList;
  @override
  @JsonKey()
  final String? idLike;
  @override
  @JsonKey(name: "judul_lagu")
  final String? judulLagu;
  @override
  @JsonKey(name: "image_lagu")
  final String? imageLagu;
  @override
  @JsonKey()
  final String? duration;
  @override
  @JsonKey(name: "asset_lagu")
  final String? assetLagu;
  @override
  @JsonKey()
  final String? localLagu;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  @override
  String toString() {
    return 'ResMusicDataModel(id: $id, idArtist: $idArtist, idGenre: $idGenre, idPlayList: $idPlayList, idLike: $idLike, judulLagu: $judulLagu, imageLagu: $imageLagu, duration: $duration, assetLagu: $assetLagu, localLagu: $localLagu, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResMusicDataModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idArtist, idArtist) ||
                other.idArtist == idArtist) &&
            (identical(other.idGenre, idGenre) || other.idGenre == idGenre) &&
            (identical(other.idPlayList, idPlayList) ||
                other.idPlayList == idPlayList) &&
            (identical(other.idLike, idLike) || other.idLike == idLike) &&
            (identical(other.judulLagu, judulLagu) ||
                other.judulLagu == judulLagu) &&
            (identical(other.imageLagu, imageLagu) ||
                other.imageLagu == imageLagu) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.assetLagu, assetLagu) ||
                other.assetLagu == assetLagu) &&
            (identical(other.localLagu, localLagu) ||
                other.localLagu == localLagu) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      idArtist,
      idGenre,
      idPlayList,
      idLike,
      judulLagu,
      imageLagu,
      duration,
      assetLagu,
      localLagu,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResMusicDataModelCopyWith<_$_ResMusicDataModel> get copyWith =>
      __$$_ResMusicDataModelCopyWithImpl<_$_ResMusicDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResMusicDataModelToJson(
      this,
    );
  }
}

abstract class _ResMusicDataModel implements ResMusicDataModel {
  factory _ResMusicDataModel(
          {final String? id,
          @JsonKey(name: "id_artist") final String? idArtist,
          @JsonKey(name: "id_genre") final String? idGenre,
          final String? idPlayList,
          final String? idLike,
          @JsonKey(name: "judul_lagu") final String? judulLagu,
          @JsonKey(name: "image_lagu") final String? imageLagu,
          final String? duration,
          @JsonKey(name: "asset_lagu") final String? assetLagu,
          final String? localLagu,
          @JsonKey(name: "created_at") final String? createdAt,
          @JsonKey(name: "updated_at") final String? updatedAt}) =
      _$_ResMusicDataModel;

  factory _ResMusicDataModel.fromJson(Map<String, dynamic> json) =
      _$_ResMusicDataModel.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: "id_artist")
  String? get idArtist;
  @override
  @JsonKey(name: "id_genre")
  String? get idGenre;
  @override
  String? get idPlayList;
  @override
  String? get idLike;
  @override
  @JsonKey(name: "judul_lagu")
  String? get judulLagu;
  @override
  @JsonKey(name: "image_lagu")
  String? get imageLagu;
  @override
  String? get duration;
  @override
  @JsonKey(name: "asset_lagu")
  String? get assetLagu;
  @override
  String? get localLagu;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ResMusicDataModelCopyWith<_$_ResMusicDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
