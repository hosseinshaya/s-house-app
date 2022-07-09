import 'dart:async';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:s_house/common/api/retrofit_client.dart';
import 'package:s_house/common/constants/app_config.dart';
import 'package:s_house/common/utils/app_directory.dart';
import 'package:s_house/common/utils/logging/log_helper.dart';

class ApiClient {
  factory ApiClient() => _instance;

  ApiClient._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        contentType: 'application/json',
        headers: {
          // if ((AuthBloc().accessToken ?? '') != '') 'Authorization': 'Bearer ${AuthBloc().accessToken}', // todo
        },
        validateStatus: (int? status) => (status ?? 0) < 500,
      ),
    )..interceptors.add(
        InterceptorsWrapper(
          onError: onError,
          onRequest: onRequest,
        ),
      );
    appDirectory().then((Directory dir) => dio.interceptors.add(
          CookieManager(
            PersistCookieJar(
              storage: FileStorage(
                dir.path,
              ),
            ),
          ),
        ));
    retrofitClient = RetrofitClient(dio);
  }

  late final Dio dio;
  late final RetrofitClient retrofitClient;
  Future<void>? isWorking;

  static final ApiClient _instance = ApiClient._init();

  void setToken(String accessToken) { // todo
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
  }

  void onError(DioError error, ErrorInterceptorHandler handler) {
    log(request: error.requestOptions, response: error.response, error: error);
    handler.next(error);
  }

  void onRequest(RequestOptions requestOptions, RequestInterceptorHandler handler) {
    log(request: requestOptions);
    handler.next(requestOptions);
  }

  void log({RequestOptions? request, Response<dynamic>? response, DioError? error}) {
    Map<String, dynamic> logData = <String, dynamic>{
      if (request != null)
        'request': <String, dynamic>{
          'method': request.method,
          'path': request.path,
          if (request.contentType != 'multipart/form-data') 'data': request.data,
          'queryParameters': request.queryParameters,
          'headers': request.headers,
        },
      if (response != null)
        'response': <String, dynamic>{
          'data': response.data,
          'statusCode': response.statusCode,
        },
      if (error != null)
        'error': <String, dynamic>{
          'type': error.type.toString(),
          'error': error.error?.toString(),
          'message': error.message,
        },
      'curl': 'curl -X ${request?.method} ${request?.uri}'
    };
    if (error != null) {
      logData.errLog();
    } else {
      logData.infoLog();
    }
  }
}
