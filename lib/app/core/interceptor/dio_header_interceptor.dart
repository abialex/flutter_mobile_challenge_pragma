// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';

class DioHeaderInterceptor extends Interceptor {
  final dio = getItApp.get<Dio>();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = (dotenv.env['API_KEY']!);
    if (kDebugMode) {
      print(token);
    }

    options.headers['x-api-key'] = token;
    options.headers['Content-Type'] = 'application/json';
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null && err.response?.statusCode == 401) {
      final response = await dio.fetch(err.requestOptions);

      return handler.resolve(response);
    }

    return handler.reject(err);
  }
}
