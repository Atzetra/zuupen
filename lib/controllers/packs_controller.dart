import 'package:get/get.dart';
import 'package:zuupen/constants/packs/card_packs.dart';

import '../enums/enums.dart';

class PacksController extends GetxController {
  final List<GameCategory> selectedPacks = [];
  final allGamePacks = allPacks.keys.toList();
  bool get isEmpty => _emptyChecker();
  final toggledPacks = <GameCategory, bool>{
    GameCategory.gettingStarted: false,
    // GameCategory.raisingTheStakes: false,
    // GameCategory.noSecrets: false,
    // GameCategory.caliente: false,
    // GameCategory.downBad: false,
  }.obs;

  @override
  void onInit() {
    setDefaults();
    // print(allGamePacks);
    super.onInit();
  }

  bool _emptyChecker() {
    if (toggledPacks.values.contains(false)) {
      return true;
    } else {
      return false;
    }
  }

  void setDefaults() {
    togglePack(GameCategory.gettingStarted);
  }

  void togglePack(GameCategory category) {
    if (toggledPacks[category] == false) {
      selectedPacks.add(category);
    } else if (toggledPacks[category] == true) {
      selectedPacks.removeWhere((element) => element == category);
    }
    toggledPacks.update(category, (value) => !value);
    // print(selectedPacks);
  }
}
