import 'package:dio/dio.dart';
import 'package:hotel_app/app/core/strings.dart';
import 'package:hotel_app/app/data/models/authentication/login/login_model.dart';
import 'package:hotel_app/app/data/models/authentication/login/login_response_model.dart';
import 'package:hotel_app/app/data/services/dio/api_exceptions.dart';
import 'package:hotel_app/app/data/services/dio/dio_service.dart';
import 'package:hotel_app/app/data/services/dio/internet_checker.dart';

class LoginService {
  Future<LoginResponseModel?> loginService(LoginModel data) async {
    if (await internetCheck()) {
      try {
        final Response response =
            await DioService.postMethod(url: Url.login, value: data.toJson());
        if (response.statusCode! >= 200 || response.statusCode! <= 299) {
          return LoginResponseModel.fromJson(response.data);
        } else {
          return null;
        }
      } catch (e) {
        return LoginResponseModel(message: ApiExceptions.handleError(e));
      }
    } else {
      return LoginResponseModel(message: 'No Internet Connection');
    }
  }
}
