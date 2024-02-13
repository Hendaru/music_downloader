import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:music_download_youtube/app/data/service/music_service.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';

class DioModule with DioMixin implements Dio {
  DioModule() {
    final newOptions = BaseOptions(
      contentType: 'application/json',
      connectTimeout: Duration(minutes: 3),
      sendTimeout: Duration(minutes: 3),
      receiveTimeout: Duration(minutes: 3),
      baseUrl: "$baseUrl",
    );

    options = newOptions;
    interceptors.addAll([AppInterceptor()]);
    httpClientAdapter = HttpClientAdapter();
  }

  MusicService get musicService => MusicService(this);
}

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    var token = "";

    var authorization = token.isNotEmpty ? 'Bearer $token' : null;

    final isAdmin = options.headers.containsKey('Authorization');
    if (!isAdmin) {
      options.headers.addAll({
        "X-Requested-With": "XMLHttpRequest",
        "Authorization": authorization,
      });
    }

    log('REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path}');
    options.headers.forEach((key, value) {
      if (value != null) log('$key: $value');
    });
    if (options.queryParameters.isNotEmpty) {
      log("queryParameters:");
      options.queryParameters.forEach((k, v) => log('$k: $v'));
    }
    log('DATA:\n${toPrettyJSONString(options.data)}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    // log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    // log('RESPONSE METHOD => ${response.requestOptions.method}');
    // log('DATA:\n${toPrettyJSONString(response.data)}');

    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    log('ERROR[${err.response?.statusCode}-${err.response?.statusMessage}] => PATH: ${err.requestOptions.baseUrl}${err.requestOptions.path}');
    log('DATA:\n${toPrettyJSONString(err.response?.data)}');

    super.onError(err, handler);
  }
}
