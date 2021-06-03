import 'package:zuupen/enums/enums.dart';

class GameCard {
  final String firstLine;
  final String secondLine;
  final CardType cardType;
  final Gender gender;

  GameCard(
      {required this.firstLine,
      required this.secondLine,
      required this.cardType,
      required this.gender});
}
