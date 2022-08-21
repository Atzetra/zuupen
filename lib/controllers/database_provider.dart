import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../enums/enums.dart';
import '../models/gamecard.dart';
import '../services/api_endpoints.dart';

final databaseProvider =
    StateNotifierProvider<DatabaseProvider, Map<GameCategory, List<GameCard>>>(
        (ref) => DatabaseProvider(ref.read));

class DatabaseProvider
    extends StateNotifier<Map<GameCategory, List<GameCard>>> {
  final Reader _read;
  DatabaseProvider(this._read)
      : super({
          GameCategory.gettingStarted: <GameCard>[],
          GameCategory.raisingTheStakes: <GameCard>[],
          GameCategory.caliente: <GameCard>[],
        }) {
    onInit();
  }

  Future<void> onInit() async {
    await Future.forEach(state.entries, (MapEntry entry) async {
      state[entry.key] =
          await _read(httpServiceProvider).getGameCards(entry.key);
    });
    state = {...state};
  }

  void onDispose() {
    state.forEach((key, value) => value = <GameCard>[]);
  }
}
