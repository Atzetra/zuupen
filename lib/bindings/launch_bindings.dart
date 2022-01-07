import 'package:get/get.dart';
import 'package:zuupen/controllers/cards_controller.dart';
import 'package:zuupen/controllers/packs_controller.dart';

import '../controllers/entry_controller.dart';
import '../controllers/player_controller.dart';

class PlayersBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PlayerController>(PlayerController(), permanent: true);
    Get.put<EntryController>(EntryController());
    Get.put<PacksController>(PacksController(), permanent: true);
    Get.put<CardsController>(CardsController());
  }
}
