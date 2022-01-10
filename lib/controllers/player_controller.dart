import 'package:get/get.dart';

import '../models/player.dart';

class PlayerController extends GetxController {
  final _players = <Player>[
    Player(name: 'Jaden'),
    Player(name: 'Fiona'),
    Player(name: 'Tammy'),
    Player(name: 'Cassia'),
    Player(name: 'Jared'),
  ].obs;
  List<Player> get players => _players;

  void addPlayer({required String name}) {
    _players.add(Player(name: name));
  }

  void removePlayer(int index) {
    _players.removeAt(index);
  }
}
