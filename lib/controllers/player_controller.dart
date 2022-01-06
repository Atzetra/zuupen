import 'package:get/get.dart';

import '../models/player.dart';

class PlayerController extends GetxController {
  final players = <Player>[].obs;

  void addPlayer({required String name}) {
    players.add(Player(name: name));
  }

  void removePlayer(int index) {
    players.removeAt(index);
  }
}
