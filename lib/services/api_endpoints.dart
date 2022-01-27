import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  final options = CacheOptions(
    store: MemCacheStore(),
  );

  HttpApiServiceImpl(this.ref);

  Future<Response> retriever(String _apiString) async {
    final dio = Dio()..interceptors.add(DioCacheInterceptor(options: options));
    return dio.get(_apiString);
  }

  @override
  Future<List<GameCard>> getGameCards(GameCategory category) async {
    final dio = Dio()..interceptors.add(DioCacheInterceptor(options: options));
    final response = await dio.get(_apiKeys[category]!);
    final returner =
        (response.data as List).map((json) => GameCard.fromJson(json)).toList();
    return returner;
  }
}
