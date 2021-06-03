import 'package:get/get.dart';
import 'package:zuupen/controllers/entry_controller.dart';
import 'package:zuupen/controllers/player_controller.dart';

class PlayersBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PlayerController>(PlayerController(), permanent: true);
    Get.put<EntryController>(EntryController());
  }
}
