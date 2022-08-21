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
          Player(name: 'Julia'),
          Player(name: 'Ben'),
        ]);

  void addPlayer(String name) {
    state = [...state, Player(name: name)];
  }

  void removePlayer(index) {
    final List<Player> buffer = state;
    buffer.removeAt(index);
    state = [...buffer];
  }
}
