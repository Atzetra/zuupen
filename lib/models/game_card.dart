import 'package:zuupen/enums/enums.dart';

class GameCard {
  late final int? id;
  final String firstLine;
  final String? secondLine;
  final CardType cardType;
  final int players;

  GameCard(
      {this.id,
      required this.firstLine,
      this.secondLine,
      required this.cardType,
      required this.players});
}
