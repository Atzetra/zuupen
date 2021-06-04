import 'package:get/get.dart';

import '../controllers/entry_controller.dart';
import '../controllers/player_controller.dart';

class PlayersBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PlayerController>(PlayerController(), permanent: true);
    Get.put<EntryController>(EntryController());
  }
}
