// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_playlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResPlaylistModel _$ResPlaylistModelFromJson(Map<String, dynamic> json) {
  return _ResPlaylistModel.fromJson(json);
}

/// @nodoc
mixin _$ResPlaylistModel {
  String? get idPlayList => throw _privateConstructorUsedError;
  String? get namePlayList => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<ResMusicDataModel> get listMusic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResPlaylistModelCopyWith<ResPlaylistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResPlaylistModelCopyWith<$Res> {
  factory $ResPlaylistModelCopyWith(
          ResPlaylistModel value, $Res Function(ResPlaylistModel) then) =
      _$ResPlaylistModelCopyWithImpl<$Res, ResPlaylistModel>;
  @useResult
  $Res call(
      {String? idPlayList,
      String? namePlayList,
      String? image,
      List<ResMusicDataModel> listMusic});
}

/// @nodoc
class _$ResPlaylistModelCopyWithImpl<$Res, $Val extends ResPlaylistModel>
    implements $ResPlaylistModelCopyWith<$Res> {
  _$ResPlaylistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPlayList = freezed,
    Object? namePlayList = freezed,
    Object? image = freezed,
    Object? listMusic = null,
  }) {
    return _then(_value.copyWith(
      idPlayList: freezed == idPlayList
          ? _value.idPlayList
          : idPlayList // ignore: cast_nullable_to_non_nullable
              as String?,
      namePlayList: freezed == namePlayList
          ? _value.namePlayList
          : namePlayList // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      listMusic: null == listMusic
          ? _value.listMusic
          : listMusic // ignore: cast_nullable_to_non_nullable
              as List<ResMusicDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResPlaylistModelCopyWith<$Res>
    implements $ResPlaylistModelCopyWith<$Res> {
  factory _$$_ResPlaylistModelCopyWith(
          _$_ResPlaylistModel value, $Res Function(_$_ResPlaylistModel) then) =
      __$$_ResPlaylistModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? idPlayList,
      String? namePlayList,
      String? image,
      List<ResMusicDataModel> listMusic});
}

/// @nodoc
class __$$_ResPlaylistModelCopyWithImpl<$Res>
    extends _$ResPlaylistModelCopyWithImpl<$Res, _$_ResPlaylistModel>
    implements _$$_ResPlaylistModelCopyWith<$Res> {
  __$$_ResPlaylistModelCopyWithImpl(
      _$_ResPlaylistModel _value, $Res Function(_$_ResPlaylistModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPlayList = freezed,
    Object? namePlayList = freezed,
    Object? image = freezed,
    Object? listMusic = null,
  }) {
    return _then(_$_ResPlaylistModel(
      idPlayList: freezed == idPlayList
          ? _value.idPlayList
          : idPlayList // ignore: cast_nullable_to_non_nullable
              as String?,
      namePlayList: freezed == namePlayList
          ? _value.namePlayList
          : namePlayList // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      listMusic: null == listMusic
          ? _value._listMusic
          : listMusic // ignore: cast_nullable_to_non_nullable
              as List<ResMusicDataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResPlaylistModel implements _ResPlaylistModel {
  _$_ResPlaylistModel(
      {this.idPlayList,
      this.namePlayList,
      this.image,
      final List<ResMusicDataModel> listMusic = const []})
      : _listMusic = listMusic;

  factory _$_ResPlaylistModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResPlaylistModelFromJson(json);

  @override
  final String? idPlayList;
  @override
  final String? namePlayList;
  @override
  final String? image;
  final List<ResMusicDataModel> _listMusic;
  @override
  @JsonKey()
  List<ResMusicDataModel> get listMusic {
    if (_listMusic is EqualUnmodifiableListView) return _listMusic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listMusic);
  }

  @override
  String toString() {
    return 'ResPlaylistModel(idPlayList: $idPlayList, namePlayList: $namePlayList, image: $image, listMusic: $listMusic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResPlaylistModel &&
            (identical(other.idPlayList, idPlayList) ||
                other.idPlayList == idPlayList) &&
            (identical(other.namePlayList, namePlayList) ||
                other.namePlayList == namePlayList) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._listMusic, _listMusic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idPlayList, namePlayList, image,
      const DeepCollectionEquality().hash(_listMusic));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResPlaylistModelCopyWith<_$_ResPlaylistModel> get copyWith =>
      __$$_ResPlaylistModelCopyWithImpl<_$_ResPlaylistModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResPlaylistModelToJson(
      this,
    );
  }
}

abstract class _ResPlaylistModel implements ResPlaylistModel {
  factory _ResPlaylistModel(
      {final String? idPlayList,
      final String? namePlayList,
      final String? image,
      final List<ResMusicDataModel> listMusic}) = _$_ResPlaylistModel;

  factory _ResPlaylistModel.fromJson(Map<String, dynamic> json) =
      _$_ResPlaylistModel.fromJson;

  @override
  String? get idPlayList;
  @override
  String? get namePlayList;
  @override
  String? get image;
  @override
  List<ResMusicDataModel> get listMusic;
  @override
  @JsonKey(ignore: true)
  _$$_ResPlaylistModelCopyWith<_$_ResPlaylistModel> get copyWith =>
      throw _privateConstructorUsedError;
}
