// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamecard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameCard _$$_GameCardFromJson(Map<String, dynamic> json) => _$_GameCard(
      firstLine: json['firstLine'] as String,
      secondLine: json['secondLine'] as String?,
      cardType: $enumDecode(_$CardTypeEnumMap, json['cardType']),
      players: json['players'] as int,
      elements: json['elements'] as int,
    );

Map<String, dynamic> _$$_GameCardToJson(_$_GameCard instance) =>
    <String, dynamic>{
      'firstLine': instance.firstLine,
      'secondLine': instance.secondLine,
      'cardType': _$CardTypeEnumMap[instance.cardType],
      'players': instance.players,
      'elements': instance.elements,
    };

const _$CardTypeEnumMap = {
  CardType.rule: 'rule',
  CardType.game: 'game',
  CardType.virus: 'virus',
  CardType.custom: 'custom',
  CardType.bottomsUp: 'bottomsUp',
  CardType.caliente: 'caliente',
  CardType.dual: 'dual',
};
