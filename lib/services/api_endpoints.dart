import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zuupen/enums/enums.dart';
import 'package:zuupen/models/gamecard.dart';

final httpServiceProvider = Provider<HttpService>((ref) {
  return HttpApiServiceImpl(ref);
});

abstract class HttpService {
  Future<List<GameCard>> getGameCards(GameCategory category);
}

const _gameCardListKey = 'gameCardListKey';

class HttpApiServiceImpl implements HttpService {
  final Ref ref;
  final _apiKeys = <GameCategory, String>{
    GameCategory.gettingStarted: dotenv.env['GETTINGSTARTED_API']!,
    GameCategory.raisingTheStakes: dotenv.env['RAISINGSTAKES_API']!,
    GameCategory.caliente: dotenv.env['CALIENTE_API']!,
  };

  HttpApiServiceImpl(this.ref);

  @override
  Future<List<GameCard>> getGameCards(GameCategory category) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _connectivityResult = await (Connectivity().checkConnectivity());
    if (_connectivityResult == ConnectivityResult.wifi ||
        _connectivityResult == ConnectivityResult.mobile ||
        _connectivityResult == ConnectivityResult.ethernet) {
      final dio = Dio();
      final response = await dio.get(_apiKeys[category]!);
      final returner = (response.data as List)
          .map((json) => GameCard.fromJson(json))
          .toList();
      _sharedPrefs.setString(category.toString(), jsonEncode(returner));
    }
    final List fetch =
        await jsonDecode(_sharedPrefs.getString(category.toString())!);
    return fetch.map((e) => GameCard.fromJson(e)).toList();
  }
}
