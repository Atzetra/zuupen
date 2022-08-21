import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../enums/enums.dart';

final toggledPacksProvider =
    StateNotifierProvider<ToggledPacks, Map<GameCategory, bool>>(
        (ref) => ToggledPacks());

class ToggledPacks extends StateNotifier<Map<GameCategory, bool>> {
  ToggledPacks()
      : super({
          GameCategory.gettingStarted: true,
          GameCategory.caliente: false,
          GameCategory.raisingTheStakes: false,
        });

  void togglePack(GameCategory category) {
    state.updateAll((key, value) => false);
    state.update(category, (value) => true);
    state = {...state};
    debugPrint(state.toString());
  }
}
