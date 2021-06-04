import 'package:zuupen/enums/enums.dart';

class Pack {
  final String name;
  final GameCategory category;
  final List cards;

  Pack({required this.category, required this.cards, required this.name});
}
