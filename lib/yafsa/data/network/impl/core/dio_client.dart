import 'package:dio/dio.dart';

import 'network_configuration.dart';

class DioClient {
  DioClient() {
    _configureInterceptors();
  }

  final Dio dio = Dio(BaseOptions(
    baseUrl: NetworkConfiguration.baseUrl,
    connectTimeout: NetworkConfiguration.connectTimeout,
  ));

  void _addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }

  void _configureInterceptors() {
    _addInterceptor(LogInterceptor());
  }
}
