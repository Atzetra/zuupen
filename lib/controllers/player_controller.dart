import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/player.dart';

final playerProvider =
    StateNotifierProvider<PlayerProvider, List<Player>>((ref) {
  return PlayerProvider();
});

class PlayerProvider extends StateNotifier<List<Player>> {
  PlayerProvider()
      : super([
          Player(name: 'Lotte'),
          Player(name: 'Marlies'),
          Player(name: 'Bruno'),
        ]);

  void addPlayer(String name) {
    state = [...state, Player(name: name)];
  }

  void removePlayer(index) {
    final List<Player> _buffer = state;
    _buffer.removeAt(index);
    state = [..._buffer];
  }
}
