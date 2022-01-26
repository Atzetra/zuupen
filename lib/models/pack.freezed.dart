// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pack.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PackTearOff {
  const _$PackTearOff();

  _Pack call({required GameCategory category, required List<GameCard> cards}) {
    return _Pack(
      category: category,
      cards: cards,
    );
  }
}

/// @nodoc
const $Pack = _$PackTearOff();

/// @nodoc
mixin _$Pack {
  GameCategory get category => throw _privateConstructorUsedError;
  List<GameCard> get cards => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PackCopyWith<Pack> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackCopyWith<$Res> {
  factory $PackCopyWith(Pack value, $Res Function(Pack) then) =
      _$PackCopyWithImpl<$Res>;
  $Res call({GameCategory category, List<GameCard> cards});
}

/// @nodoc
class _$PackCopyWithImpl<$Res> implements $PackCopyWith<$Res> {
  _$PackCopyWithImpl(this._value, this._then);

  final Pack _value;
  // ignore: unused_field
  final $Res Function(Pack) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? cards = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as GameCategory,
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<GameCard>,
    ));
  }
}

/// @nodoc
abstract class _$PackCopyWith<$Res> implements $PackCopyWith<$Res> {
  factory _$PackCopyWith(_Pack value, $Res Function(_Pack) then) =
      __$PackCopyWithImpl<$Res>;
  @override
  $Res call({GameCategory category, List<GameCard> cards});
}

/// @nodoc
class __$PackCopyWithImpl<$Res> extends _$PackCopyWithImpl<$Res>
    implements _$PackCopyWith<$Res> {
  __$PackCopyWithImpl(_Pack _value, $Res Function(_Pack) _then)
      : super(_value, (v) => _then(v as _Pack));

  @override
  _Pack get _value => super._value as _Pack;

  @override
  $Res call({
    Object? category = freezed,
    Object? cards = freezed,
  }) {
    return _then(_Pack(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as GameCategory,
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<GameCard>,
    ));
  }
}

/// @nodoc

class _$_Pack implements _Pack {
  _$_Pack({required this.category, required this.cards});

  @override
  final GameCategory category;
  @override
  final List<GameCard> cards;

  @override
  String toString() {
    return 'Pack(category: $category, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Pack &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.cards, cards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(cards));

  @JsonKey(ignore: true)
  @override
  _$PackCopyWith<_Pack> get copyWith =>
      __$PackCopyWithImpl<_Pack>(this, _$identity);
}

abstract class _Pack implements Pack {
  factory _Pack(
      {required GameCategory category,
      required List<GameCard> cards}) = _$_Pack;

  @override
  GameCategory get category;
  @override
  List<GameCard> get cards;
  @override
  @JsonKey(ignore: true)
  _$PackCopyWith<_Pack> get copyWith => throw _privateConstructorUsedError;
}
