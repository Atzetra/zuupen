// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gamecard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameCard _$GameCardFromJson(Map<String, dynamic> json) {
  return _GameCard.fromJson(json);
}

/// @nodoc
class _$GameCardTearOff {
  const _$GameCardTearOff();

  _GameCard call(
      {required String firstLine,
      String? secondLine,
      required CardType cardType,
      required int players,
      required int elements}) {
    return _GameCard(
      firstLine: firstLine,
      secondLine: secondLine,
      cardType: cardType,
      players: players,
      elements: elements,
    );
  }

  GameCard fromJson(Map<String, Object?> json) {
    return GameCard.fromJson(json);
  }
}

/// @nodoc
const $GameCard = _$GameCardTearOff();

/// @nodoc
mixin _$GameCard {
  String get firstLine => throw _privateConstructorUsedError;
  String? get secondLine => throw _privateConstructorUsedError;
  CardType get cardType => throw _privateConstructorUsedError;
  int get players => throw _privateConstructorUsedError;
  int get elements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameCardCopyWith<GameCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCardCopyWith<$Res> {
  factory $GameCardCopyWith(GameCard value, $Res Function(GameCard) then) =
      _$GameCardCopyWithImpl<$Res>;
  $Res call(
      {String firstLine,
      String? secondLine,
      CardType cardType,
      int players,
      int elements});
}

/// @nodoc
class _$GameCardCopyWithImpl<$Res> implements $GameCardCopyWith<$Res> {
  _$GameCardCopyWithImpl(this._value, this._then);

  final GameCard _value;
  // ignore: unused_field
  final $Res Function(GameCard) _then;

  @override
  $Res call({
    Object? firstLine = freezed,
    Object? secondLine = freezed,
    Object? cardType = freezed,
    Object? players = freezed,
    Object? elements = freezed,
  }) {
    return _then(_value.copyWith(
      firstLine: firstLine == freezed
          ? _value.firstLine
          : firstLine // ignore: cast_nullable_to_non_nullable
              as String,
      secondLine: secondLine == freezed
          ? _value.secondLine
          : secondLine // ignore: cast_nullable_to_non_nullable
              as String?,
      cardType: cardType == freezed
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as int,
      elements: elements == freezed
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$GameCardCopyWith<$Res> implements $GameCardCopyWith<$Res> {
  factory _$GameCardCopyWith(_GameCard value, $Res Function(_GameCard) then) =
      __$GameCardCopyWithImpl<$Res>;
  @override
  $Res call(
      {String firstLine,
      String? secondLine,
      CardType cardType,
      int players,
      int elements});
}

/// @nodoc
class __$GameCardCopyWithImpl<$Res> extends _$GameCardCopyWithImpl<$Res>
    implements _$GameCardCopyWith<$Res> {
  __$GameCardCopyWithImpl(_GameCard _value, $Res Function(_GameCard) _then)
      : super(_value, (v) => _then(v as _GameCard));

  @override
  _GameCard get _value => super._value as _GameCard;

  @override
  $Res call({
    Object? firstLine = freezed,
    Object? secondLine = freezed,
    Object? cardType = freezed,
    Object? players = freezed,
    Object? elements = freezed,
  }) {
    return _then(_GameCard(
      firstLine: firstLine == freezed
          ? _value.firstLine
          : firstLine // ignore: cast_nullable_to_non_nullable
              as String,
      secondLine: secondLine == freezed
          ? _value.secondLine
          : secondLine // ignore: cast_nullable_to_non_nullable
              as String?,
      cardType: cardType == freezed
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as int,
      elements: elements == freezed
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameCard implements _GameCard {
  const _$_GameCard(
      {required this.firstLine,
      this.secondLine,
      required this.cardType,
      required this.players,
      required this.elements});

  factory _$_GameCard.fromJson(Map<String, dynamic> json) =>
      _$$_GameCardFromJson(json);

  @override
  final String firstLine;
  @override
  final String? secondLine;
  @override
  final CardType cardType;
  @override
  final int players;
  @override
  final int elements;

  @override
  String toString() {
    return 'GameCard(firstLine: $firstLine, secondLine: $secondLine, cardType: $cardType, players: $players, elements: $elements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameCard &&
            const DeepCollectionEquality().equals(other.firstLine, firstLine) &&
            const DeepCollectionEquality()
                .equals(other.secondLine, secondLine) &&
            const DeepCollectionEquality().equals(other.cardType, cardType) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.elements, elements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstLine),
      const DeepCollectionEquality().hash(secondLine),
      const DeepCollectionEquality().hash(cardType),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(elements));

  @JsonKey(ignore: true)
  @override
  _$GameCardCopyWith<_GameCard> get copyWith =>
      __$GameCardCopyWithImpl<_GameCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameCardToJson(this);
  }
}

abstract class _GameCard implements GameCard {
  const factory _GameCard(
      {required String firstLine,
      String? secondLine,
      required CardType cardType,
      required int players,
      required int elements}) = _$_GameCard;

  factory _GameCard.fromJson(Map<String, dynamic> json) = _$_GameCard.fromJson;

  @override
  String get firstLine;
  @override
  String? get secondLine;
  @override
  CardType get cardType;
  @override
  int get players;
  @override
  int get elements;
  @override
  @JsonKey(ignore: true)
  _$GameCardCopyWith<_GameCard> get copyWith =>
      throw _privateConstructorUsedError;
}
