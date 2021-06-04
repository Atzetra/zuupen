import 'package:get/get.dart';
import 'package:zuupen/enums/enums.dart';
import 'package:zuupen/models/pack.dart';

class PacksController extends GetxController {
  final selectedPacks = <Pack>[].obs;
  final allPacks = <Pack>[].obs;
  final toggledPacks = <GameCategory, bool>{
    GameCategory.gettingStarted: true,
    GameCategory.raisingTheStakes: false,
    GameCategory.noSecrets: false,
    GameCategory.caliente: false,
    GameCategory.downBad: false,
  }.obs;

  void togglePack(GameCategory category) {
    if (toggledPacks[category] == false) {}
    toggledPacks.update(category, (value) => !value);
  }
}
