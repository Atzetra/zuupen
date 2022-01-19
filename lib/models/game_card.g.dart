// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameCard _$GameCardFromJson(Map<String, dynamic> json) => GameCard(
      id: json['id'] as int?,
      firstLine: json['firstLine'] as String,
      secondLine: json['secondLine'] as String?,
      cardType: $enumDecode(_$CardTypeEnumMap, json['cardType']),
      players: json['players'] as int,
      elements: json['elements'] as int,
    );

Map<String, dynamic> _$GameCardToJson(GameCard instance) => <String, dynamic>{
      'id': instance.id,
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
