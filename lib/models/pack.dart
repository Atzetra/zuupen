import 'package:zuupen/enums/enums.dart';
import 'package:zuupen/models/game_card.dart';

class Pack {
  final GameCategory category;
  final List<GameCard> cards;

  Pack(this.category, this.cards);
}
