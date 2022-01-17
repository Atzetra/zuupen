import 'package:get/get.dart';

import '../models/player.dart';

class PlayerController extends GetxController {
  final _players = <Player>[
    Player(name: 'Lotte'),
    Player(name: 'Fiona'),
    Player(name: 'Niek'),
    Player(name: 'Marlies'),
    Player(name: 'Thijs'),
  ].obs;
  List<Player> get players => _players;

  void addPlayer({required String name}) {
    _players.add(Player(name: name));
    update();
  }

  void removePlayer(int index) {
    _players.removeAt(index);
    update();
  }
}
