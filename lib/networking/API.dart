import 'package:dio/dio.dart';
import 'package:erplytest/utils/Utils.dart';
import 'package:flutter/cupertino.dart';

class API {
  static final API _singleton = API._internal();

  factory API() {
    return _singleton;
  }

  Dio dio;

  API._internal() {
    dio = Dio(BaseOptions(
        baseUrl: Utils.baseURL,
        followRedirects: true,
        validateStatus: (status) {
          return status < 300;
        }));
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
          debugPrint(options.uri.toString());
      return options;
    }, onResponse: (Response response) async {
      // Do something with response data
      debugPrint(response.data);
      return parseJson(response.data); // continue
    }, onError: (DioError e) async {
      // Do something with response error
      return e; //continue
    }));
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  }

  Future<Response<T>> get<T>({String url = "api", Map<String, dynamic> params}) async => await dio.get<T>(url, queryParameters: params);
}
