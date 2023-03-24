// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_gradient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ColorGradient _$ColorGradientFromJson(Map<String, dynamic> json) {
  return _ColorGradient.fromJson(json);
}

/// @nodoc
mixin _$ColorGradient {
  List<ListColorGradient>? get colorGradient =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColorGradientCopyWith<ColorGradient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorGradientCopyWith<$Res> {
  factory $ColorGradientCopyWith(
          ColorGradient value, $Res Function(ColorGradient) then) =
      _$ColorGradientCopyWithImpl<$Res, ColorGradient>;
  @useResult
  $Res call({List<ListColorGradient>? colorGradient});
}

/// @nodoc
class _$ColorGradientCopyWithImpl<$Res, $Val extends ColorGradient>
    implements $ColorGradientCopyWith<$Res> {
  _$ColorGradientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorGradient = freezed,
  }) {
    return _then(_value.copyWith(
      colorGradient: freezed == colorGradient
          ? _value.colorGradient
          : colorGradient // ignore: cast_nullable_to_non_nullable
              as List<ListColorGradient>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ColorGradientCopyWith<$Res>
    implements $ColorGradientCopyWith<$Res> {
  factory _$$_ColorGradientCopyWith(
          _$_ColorGradient value, $Res Function(_$_ColorGradient) then) =
      __$$_ColorGradientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ListColorGradient>? colorGradient});
}

/// @nodoc
class __$$_ColorGradientCopyWithImpl<$Res>
    extends _$ColorGradientCopyWithImpl<$Res, _$_ColorGradient>
    implements _$$_ColorGradientCopyWith<$Res> {
  __$$_ColorGradientCopyWithImpl(
      _$_ColorGradient _value, $Res Function(_$_ColorGradient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorGradient = freezed,
  }) {
    return _then(_$_ColorGradient(
      colorGradient: freezed == colorGradient
          ? _value._colorGradient
          : colorGradient // ignore: cast_nullable_to_non_nullable
              as List<ListColorGradient>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ColorGradient implements _ColorGradient {
  _$_ColorGradient({final List<ListColorGradient>? colorGradient})
      : _colorGradient = colorGradient;

  factory _$_ColorGradient.fromJson(Map<String, dynamic> json) =>
      _$$_ColorGradientFromJson(json);

  final List<ListColorGradient>? _colorGradient;
  @override
  List<ListColorGradient>? get colorGradient {
    final value = _colorGradient;
    if (value == null) return null;
    if (_colorGradient is EqualUnmodifiableListView) return _colorGradient;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ColorGradient(colorGradient: $colorGradient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColorGradient &&
            const DeepCollectionEquality()
                .equals(other._colorGradient, _colorGradient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_colorGradient));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColorGradientCopyWith<_$_ColorGradient> get copyWith =>
      __$$_ColorGradientCopyWithImpl<_$_ColorGradient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ColorGradientToJson(
      this,
    );
  }
}

abstract class _ColorGradient implements ColorGradient {
  factory _ColorGradient({final List<ListColorGradient>? colorGradient}) =
      _$_ColorGradient;

  factory _ColorGradient.fromJson(Map<String, dynamic> json) =
      _$_ColorGradient.fromJson;

  @override
  List<ListColorGradient>? get colorGradient;
  @override
  @JsonKey(ignore: true)
  _$$_ColorGradientCopyWith<_$_ColorGradient> get copyWith =>
      throw _privateConstructorUsedError;
}

ListColorGradient _$ListColorGradientFromJson(Map<String, dynamic> json) {
  return _ListColorGradient.fromJson(json);
}

/// @nodoc
mixin _$ListColorGradient {
  List<int>? get listGradientColorModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListColorGradientCopyWith<ListColorGradient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListColorGradientCopyWith<$Res> {
  factory $ListColorGradientCopyWith(
          ListColorGradient value, $Res Function(ListColorGradient) then) =
      _$ListColorGradientCopyWithImpl<$Res, ListColorGradient>;
  @useResult
  $Res call({List<int>? listGradientColorModel});
}

/// @nodoc
class _$ListColorGradientCopyWithImpl<$Res, $Val extends ListColorGradient>
    implements $ListColorGradientCopyWith<$Res> {
  _$ListColorGradientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listGradientColorModel = freezed,
  }) {
    return _then(_value.copyWith(
      listGradientColorModel: freezed == listGradientColorModel
          ? _value.listGradientColorModel
          : listGradientColorModel // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListColorGradientCopyWith<$Res>
    implements $ListColorGradientCopyWith<$Res> {
  factory _$$_ListColorGradientCopyWith(_$_ListColorGradient value,
          $Res Function(_$_ListColorGradient) then) =
      __$$_ListColorGradientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int>? listGradientColorModel});
}

/// @nodoc
class __$$_ListColorGradientCopyWithImpl<$Res>
    extends _$ListColorGradientCopyWithImpl<$Res, _$_ListColorGradient>
    implements _$$_ListColorGradientCopyWith<$Res> {
  __$$_ListColorGradientCopyWithImpl(
      _$_ListColorGradient _value, $Res Function(_$_ListColorGradient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listGradientColorModel = freezed,
  }) {
    return _then(_$_ListColorGradient(
      listGradientColorModel: freezed == listGradientColorModel
          ? _value._listGradientColorModel
          : listGradientColorModel // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListColorGradient implements _ListColorGradient {
  _$_ListColorGradient({final List<int>? listGradientColorModel})
      : _listGradientColorModel = listGradientColorModel;

  factory _$_ListColorGradient.fromJson(Map<String, dynamic> json) =>
      _$$_ListColorGradientFromJson(json);

  final List<int>? _listGradientColorModel;
  @override
  List<int>? get listGradientColorModel {
    final value = _listGradientColorModel;
    if (value == null) return null;
    if (_listGradientColorModel is EqualUnmodifiableListView)
      return _listGradientColorModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListColorGradient(listGradientColorModel: $listGradientColorModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListColorGradient &&
            const DeepCollectionEquality().equals(
                other._listGradientColorModel, _listGradientColorModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_listGradientColorModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListColorGradientCopyWith<_$_ListColorGradient> get copyWith =>
      __$$_ListColorGradientCopyWithImpl<_$_ListColorGradient>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListColorGradientToJson(
      this,
    );
  }
}

abstract class _ListColorGradient implements ListColorGradient {
  factory _ListColorGradient({final List<int>? listGradientColorModel}) =
      _$_ListColorGradient;

  factory _ListColorGradient.fromJson(Map<String, dynamic> json) =
      _$_ListColorGradient.fromJson;

  @override
  List<int>? get listGradientColorModel;
  @override
  @JsonKey(ignore: true)
  _$$_ListColorGradientCopyWith<_$_ListColorGradient> get copyWith =>
      throw _privateConstructorUsedError;
}
