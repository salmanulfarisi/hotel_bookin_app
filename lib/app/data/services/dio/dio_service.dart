import 'package:dio/dio.dart';
import 'package:hotel_app/app/core/strings.dart';

class DioService {
  static final dio = Dio(
    BaseOptions(
      baseUrl: Url.baseUrl,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    ),
  );
  // ====================>> POST <<====================
  static Future<dynamic> postMethod(
      {required String url, required value}) async {
    return await dio.post(url, data: value).then((value) => value);
  }

  // ====================>> GET <<====================
  static Future<Response> getMethod({required String url}) async {
    return await dio.get(url).then((value) => value);
  }
}
