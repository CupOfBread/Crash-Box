import 'package:bruno/bruno.dart';
import 'package:crash_box/common/Logger.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'global_value.dart';

Future<void> setupServiceLocator() async {
  GetIt.I.registerSingleton<GlobalValue>(GlobalValue());
  initDio();
}

void initDio() {
  final globalValue = GlobalValue();
  final dio = Dio();

  dio.options.baseUrl = globalValue.serverUrl;
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 3);
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        LogI("HTTP Request\nURL: ${options.uri}, METHOD: ${options.method}\n"
            "HEADERS: ${options.headers}\n"
            "PARAMS: ${options.queryParameters}\n"
            "DATA: ${options.data}");
        return handler.next(options);
      },
      onResponse: (response, ResponseInterceptorHandler handler) {
        LogI("HTTP Response\nURL: ${response.requestOptions.uri}, METHOD: ${response.requestOptions.method}\n"
            "PARAMS: ${response.statusCode}\n"
            "DATA: ${response.data.toString().length > 800 ? response.data.toString().substring(0, 800) : response.data}");
        return handler.next(response);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        BrnToast.show("网络连接失败", Get.overlayContext!);
        return handler.next(error);
      },
    ),
  );

  GetIt.I.registerSingleton<Dio>(dio);
}
