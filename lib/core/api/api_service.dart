import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:fdflutter/core/api/interceptors/logs_interceptors.dart';
import 'package:fdflutter/core/api/interceptors/network_interceptor.dart';
import 'package:fdflutter/core/api/interceptors/response_interceptor.dart';
import 'package:fdflutter/core/api/interceptors/token_Interceptor.dart';

class ApiService {
  static const contentTypeJson = "application/json";
  static const contentTypeFormData = "multipart/form-data";
  static const contentTypeForm = "application/x-www-form-urlencoded";

  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    // _dio.options.connectTimeout = const Duration(milliseconds: 5000);
    // _dio.options.receiveTimeout = const Duration(milliseconds: 3000);

    // _dio.interceptors.add(TokenInterceptors());
    // _dio.interceptors.add(NetworkInterceptors());
    // _dio.interceptors.add(LogsInterceptors());
    // _dio.interceptors.add(ResponseInterceptors());
    // _dio.options.headers ??= HashMap();
    // _dio.options.headers!['content-type'] = contentTypeJson;
    // _dio.options.headers!['accept'] = contentTypeJson;

  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return _dio.post(path, data: data);
  }

  Future<Response> put(String path, {dynamic data}) async {
    return _dio.put(path, data: data);
  }

  Future<Response> patch(String path, {dynamic data}) async {
    return _dio.patch(path, data: data);
  }

  Future<Response> delete(String path) async {
    return _dio.delete(path);
  }
}
