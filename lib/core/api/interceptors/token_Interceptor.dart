// Package imports:
import 'package:dio/dio.dart';
import 'package:fdflutter/core/utils/logger.dart';
import 'package:fdflutter/data/datasources/local_storage.dart';

class TokenInterceptors extends InterceptorsWrapper {
  String? _token;

  @override
  onRequest(RequestOptions options, handler) async {
    if (_token == null) {
      var authorizationCode = await LocalStorage.get("token");
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    if (_token != null) {
      options.headers["Authorization"] = _token;
    }
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, handler) async {
    try {
      var responseJson = response.data;
      if (response.statusCode == 201 && responseJson["token"] != null) {
        _token = responseJson["token"];
        await LocalStorage.save("token", _token);
      }
    } catch (e) {
      logger.e(e);
    }
    return super.onResponse(response, handler);
  }
}
