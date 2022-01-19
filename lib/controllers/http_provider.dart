import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;

class HttpProvider {
  Future<http.Response> getData(String? url) async {
    var file = await DefaultCacheManager().getSingleFile(url!);
    if (await file.exists()) {
      var res = await file.readAsString();
      return http.Response(res, 200);
    }
    return http.Response('', 404);
  }
}
