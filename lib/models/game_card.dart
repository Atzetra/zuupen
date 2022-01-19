import 'package:json_annotation/json_annotation.dart';

import '../enums/enums.dart';

part 'game_card.g.dart';

@JsonSerializable()
class GameCard {
  String firstLine;
  String? secondLine;
  final CardType cardType;
  final int players;
  final int elements;

  GameCard(
      {required this.firstLine,
      this.secondLine,
      required this.cardType,
      required this.players,
      required this.elements});

  factory GameCard.fromJson(Map<String, dynamic> json) =>
      _$GameCardFromJson(json);

  Map<String, dynamic> toJson() => _$GameCardToJson(this);

  GameCard clone({
    int? id,
    String? firstLine,
    String? secondLine,
    CardType? cardType,
    int? players,
    int? elements,
  }) {
    return GameCard(
      firstLine: firstLine ?? this.firstLine,
      secondLine: secondLine ?? this.secondLine,
      cardType: cardType ?? this.cardType,
      players: players ?? this.players,
      elements: elements ?? this.elements,
    );
  }
}
