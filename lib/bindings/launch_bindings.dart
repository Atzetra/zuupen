import 'package:get/get.dart';
import 'package:zuupen/controllers/cards_controller.dart';
import 'package:zuupen/controllers/feedback_controller.dart';
import 'package:zuupen/controllers/game_controller.dart';
import 'package:zuupen/controllers/packs_controller.dart';

import '../controllers/entry_controller.dart';
import '../controllers/player_controller.dart';

class PlayersBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PlayerController>(PlayerController());
    Get.put<EntryController>(EntryController());
  }
}

class PacksBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PacksController>(PacksController());
  }
}

class GameScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<CardsController>(CardsController());
    Get.put<GameController>(GameController());
  }
}

class FeedbackBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<FeedbackController>(FeedbackController());
  }
}
