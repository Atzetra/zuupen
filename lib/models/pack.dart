import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/enums.dart';

import 'gamecard.dart';

part 'pack.freezed.dart';

@freezed
class Pack with _$Pack {
  factory Pack({
    required GameCategory category,
    required List<GameCard> cards,
  }) = _Pack;
}
