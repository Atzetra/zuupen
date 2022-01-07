import 'package:get/get.dart';
import 'package:zuupen/constants/packs/card_packs.dart';

import '../enums/enums.dart';
import '../models/pack.dart';

class PacksController extends GetxController {
  final selectedPacks = <Pack>[
    Pack(category: GameCategory.gettingStarted, cards: gettingStarted),
  ].obs;
  final allPacks = <Pack>[
    Pack(category: GameCategory.gettingStarted, cards: gettingStarted),
    // TODO: Implement other card packs
    // Pack(category: GameCategory.caliente, cards: caliente),
  ].obs;
  final toggledPacks = <GameCategory, bool>{
    GameCategory.gettingStarted: true,
    // GameCategory.raisingTheStakes: false,
    // GameCategory.noSecrets: false,
    // GameCategory.caliente: false,
    // GameCategory.downBad: false,
  }.obs;

  void togglePack(GameCategory category) {
    if (toggledPacks[category] == false) {
      selectedPacks
          .add(allPacks.firstWhere((value) => value.category == category));
    } else if (toggledPacks[category] == true) {
      selectedPacks.removeWhere((element) => element.category == category);
    }
    toggledPacks.update(category, (value) => !value);
    print(selectedPacks.toString());
  }
}
