import '../enums/enums.dart';

class GameCard {
  late final int? id;
  String firstLine;
  String? secondLine;
  final CardType cardType;
  final int players;
  final int elements;

  GameCard(
      {this.id,
      required this.firstLine,
      this.secondLine,
      required this.cardType,
      required this.players,
      required this.elements});

  GameCard clone({
    int? id,
    String? firstLine,
    String? secondLine,
    CardType? cardType,
    int? players,
    int? elements,
  }) {
    return GameCard(
      id: id ?? this.id,
      firstLine: firstLine ?? this.firstLine,
      secondLine: secondLine ?? this.secondLine,
      cardType: cardType ?? this.cardType,
      players: players ?? this.players,
      elements: elements ?? this.elements,
    );
  }
}
