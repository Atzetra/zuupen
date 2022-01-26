import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zuupen/controllers/database_provider.dart';
import 'package:zuupen/enums/enums.dart';

final dioProvider = Provider<Dio>((ref) {
  final options = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.refresh,
  );
  return Dio()..interceptors.add(DioCacheInterceptor(options: options));
});

final responseProvider = FutureProvider<bool>((ref) async {
  final dio = ref.watch(dioProvider);
  final database = ref.watch(databaseProvider.notifier);
  final response1 = await dio.get<dynamic>(dotenv.env['GETTINGSTARTED_API']!);
  final response2 = await dio.get<dynamic>(dotenv.env['RAISINGSTAKES_API']!);
  final response3 = await dio.get<dynamic>(dotenv.env['CALIENTE_API']!);
  if ((response1.statusCode == 304 || response1.statusCode == 200) &&
      (response2.statusCode == 304 || response2.statusCode == 200) &&
      (response3.statusCode == 304 || response3.statusCode == 200)) {
    // Add the cards to all decks
    database.packAdd(response1.data, GameCategory.gettingStarted);
    database.packAdd(response2.data, GameCategory.raisingTheStakes);
    database.packAdd(response3.data, GameCategory.caliente);
    return true;
  }
  return false;
});
