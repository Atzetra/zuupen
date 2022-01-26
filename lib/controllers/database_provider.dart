import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../enums/enums.dart';
import '../models/gamecard.dart';

final databaseProvider =
    StateNotifierProvider<DatabaseProvider, Map<GameCategory, List<GameCard>>>(
        (ref) => DatabaseProvider());

class DatabaseProvider
    extends StateNotifier<Map<GameCategory, List<GameCard>>> {
  DatabaseProvider()
      : super({
          GameCategory.gettingStarted: <GameCard>[],
          GameCategory.raisingTheStakes: <GameCard>[],
          GameCategory.caliente: <GameCard>[],
        });

  Future<void> packAdd(List response, GameCategory category) async {
    for (var _item in response) {
      state[category]!.add(
        GameCard.fromJson(_item),
      );
    }
    state = {...state};
  }
}
