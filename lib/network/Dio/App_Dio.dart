import 'package:dio/dio.dart';

/////////////App dio
class AppDioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://fakestoreapi.com/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getdata({
    required String url,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
    };
    return dio!.get(url);
  }

  static Future<Response> postdata({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
    };
    return dio!.post(url, data: data, queryParameters: query);
  }
}
