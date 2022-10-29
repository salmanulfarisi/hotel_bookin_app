import 'package:dio/dio.dart';
import 'package:hotel_app/app/core/strings.dart';
import 'package:hotel_app/app/data/models/authentication/signup/signup_model.dart';
import 'package:hotel_app/app/data/models/authentication/signup/signup_response_model.dart';
import 'package:hotel_app/app/data/services/dio/api_exceptions.dart';
import 'package:hotel_app/app/data/services/dio/dio_service.dart';
import 'package:hotel_app/app/data/services/dio/internet_checker.dart';

class SignUpService {
  Future<SignupResponseModel?> signUpService(SignupModel data) async {
    if (await internetCheck()) {
      try {
        final Response response =
            await DioService.postMethod(url: Url.signup, value: data.toJson());
        if (response.statusCode == 200 && response.statusCode! <= 299) {
          return SignupResponseModel.fromJson(response.data);
        } else {
          return null;
        }
      } catch (e) {
        return SignupResponseModel(message: ApiExceptions.handleError(e));
      }
    } else {
      return SignupResponseModel(message: 'No Internet Connection');
    }
  }
}
