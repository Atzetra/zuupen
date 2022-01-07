import '../enums/enums.dart';
import 'game_card.dart';

class Pack {
  final GameCategory category;
  final List<GameCard> cards;

  Pack({required this.category, required this.cards});
}
