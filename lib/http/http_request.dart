import 'package:dio/dio.dart';

import 'error_interceptor.dart';

class HttpRequest {
  final Dio _dio = Dio();

  final String? baseUrl;

  final int connectTimeout;

  final int receiveTimeout;

  HttpRequest(
      {this.baseUrl, this.connectTimeout = 5, this.receiveTimeout = 3}) {
    _initConfig();
  }

//  初始化dio相关配置
  void _initConfig() {
    if (baseUrl != null) {
      _dio.options.baseUrl = baseUrl!;
    }
    _dio.options.connectTimeout = Duration(seconds: connectTimeout);
    _dio.options.receiveTimeout = Duration(seconds: receiveTimeout);
    _dio.interceptors.add(ErrorInterceptor());
  }

  // get请求
  Future<dynamic> get(String url,
      {Map<String, dynamic>? params, Object? data}) async {
    final respond = await _dio.get(url, queryParameters: params, data: data);
    return respond;
  }

  // post请求
  Future<dynamic> post(String url,
      {params = Map<String, dynamic>, data = Object}) async {
    final respond = await _dio.post(url, queryParameters: params, data: data);
    return respond;
  }
}

HttpRequest request = HttpRequest(baseUrl: 'https://cnodejs.org/api/v1');
