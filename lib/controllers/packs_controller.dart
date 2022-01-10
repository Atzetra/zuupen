import 'package:get/get.dart';

import '../enums/enums.dart';

class PacksController extends GetxController {
  final List<GameCategory> _selectedPacks = [];
  final _toggledPacks = <GameCategory, bool>{
    GameCategory.gettingStarted: false,
    // GameCategory.raisingTheStakes: false,
    // GameCategory.noSecrets: false,
    // GameCategory.caliente: false,
    // GameCategory.downBad: false,
  }.obs;
  List<GameCategory> get selectedPacks => _selectedPacks;
  bool get isEmpty => _emptyChecker();
  Map<GameCategory, bool> get toggledPacks => _toggledPacks;

  @override
  void onInit() {
    _setDefaults();
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

  void _setDefaults() {
    _togglePack(GameCategory.gettingStarted);
  }

  void togglePack(GameCategory _category) => _togglePack(_category);

  void _togglePack(GameCategory category) {
    if (toggledPacks[category] == false) {
      selectedPacks.add(category);
    } else if (toggledPacks[category] == true) {
      selectedPacks.removeWhere((element) => element == category);
    }
    toggledPacks.update(category, (value) => !value);
    // print(selectedPacks);
  }
}
