import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

// dio拦截器实现，onResponse，onError，onRequest
class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data?['success'] != true) {
      // 显示错误信息
      Fluttertoast.showToast(msg: response.data?.msg ?? '未知错误');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      if (err.response?.statusCode == 404) {
        // 显示404错误
        Fluttertoast.showToast(msg: '服务器资源找不到');
      } else {
        String msg = '服务器异常(${err.response?.statusCode})';
        Fluttertoast.showToast(msg: msg);
      }
    }
    super.onError(err, handler);
  }
}
