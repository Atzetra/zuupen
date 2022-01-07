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
}
