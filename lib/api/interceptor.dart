import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(options, handler) async {
    final String token = 'token';
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['User-Agent'] = 'Mozilla/5.0';
    options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    return super.onRequest(options, handler);
  }
}
