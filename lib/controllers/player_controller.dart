import 'package:get/get.dart';

import '../models/player.dart';

class PlayerController extends GetxController {
  final players = <Player>[
    Player(name: 'Enzo'),
    Player(name: 'Angela'),
    Player(name: 'Quinty'),
    Player(name: 'Marlies'),
    Player(name: 'Ilse'),
  ].obs;

  void addPlayer({required String name}) {
    players.add(Player(name: name));
  }

  void removePlayer(int index) {
    players.removeAt(index);
  }
}
