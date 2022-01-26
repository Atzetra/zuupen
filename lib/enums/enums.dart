import 'package:freezed_annotation/freezed_annotation.dart';

enum Gender {
  male,
  female,
}

enum GameCategory {
  gettingStarted,
  raisingTheStakes,
  noSecrets,
  caliente,
  downBad,
}
enum CardType {
  @JsonValue('rule')
  rule,
  @JsonValue('game')
  game,
  @JsonValue('virus')
  virus,
  @JsonValue('custom')
  custom,
  @JsonValue('bottomsUp')
  bottomsUp,
  @JsonValue('caliente')
  caliente,
  @JsonValue('dual')
  dual,
}
