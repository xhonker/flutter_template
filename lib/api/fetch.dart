import 'dart:convert';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'base_entity.dart';

List<Interceptor> _interceptors = [];
String _baseUrl;
int _connectTimeout = 15000;
int _receiveTimeout = 15000;
int _sendTimeout = 10000;

void configDio({
  @required String baseUrl,
  List<Interceptor> interceptors,
  int connectTimeout,
  int receiveTimeout,
  int sendTimeout,
}) {
  _interceptors = interceptors ?? _interceptors;
  _baseUrl = baseUrl ?? _baseUrl;
  _sendTimeout = sendTimeout ?? _sendTimeout;
  _connectTimeout = connectTimeout ?? _connectTimeout;
  _receiveTimeout = receiveTimeout ?? _receiveTimeout;
}

class DioUtils {
  factory DioUtils() => _singleton;
  static DioUtils get instance => DioUtils();
  static final DioUtils _singleton = DioUtils._();
  static Dio _dio;
  DioUtils._() {
    final BaseOptions _options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
    );
    _dio = Dio(_options);
    _dio.interceptors.addAll(_interceptors);
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      // client.findProxy = (uri) {
      //   return "PROXY 192.168.0.100:8888"; // TODO: proxy
      // };
      client.badCertificateCallback = (cret, host, port) => true;
    };
  }

  Future<BaseEntity<T>> request<T>(String url,
      {RequestMethod method = RequestMethod.get, Map<String, dynamic> params}) async {
    bool isPost = method == RequestMethod.post;
    try {
      var response = await _dio.request(url,
          options: Options(method: method.value),
          queryParameters: isPost ? null : params,
          data: isPost ? params : null);
      var data = response.toString();
      final bool isCompute = data.length > 10 * 1024;
      final Map<String, dynamic> _map = isCompute ? await compute(parseData, data) : parseData(data);
      return BaseEntity<T>.fromJson(_map);
    } catch (_) {
      print("error $_");
    }
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

enum RequestMethod { get, post }

extension MethodExtension on RequestMethod {
  String get value => ['GET', 'POST'][index];
}
