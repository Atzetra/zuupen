import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/enums.dart';

part 'gamecard.freezed.dart';
part 'gamecard.g.dart';

@freezed
class GameCard with _$GameCard {
  const factory GameCard(
      {required String firstLine,
      String? secondLine,
      required CardType cardType,
      required int players,
      required int elements}) = _GameCard;

  factory GameCard.fromJson(Map<String, dynamic> json) =>
      _$GameCardFromJson(json);
}
