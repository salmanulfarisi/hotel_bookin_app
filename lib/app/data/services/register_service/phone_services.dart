import 'package:hotel_app/app/core/strings.dart';
import 'package:hotel_app/app/data/models/authentication/otp/otp_model.dart';
import 'package:hotel_app/app/data/models/authentication/otp/otp_response_model.dart';
import 'package:hotel_app/app/data/models/authentication/phone_number/phone_number_model.dart';
import 'package:hotel_app/app/data/models/authentication/phone_number/phone_number_respone_model.dart';
import 'package:hotel_app/app/data/services/dio/api_exceptions.dart';
import 'package:hotel_app/app/data/services/dio/dio_service.dart';
import 'package:hotel_app/app/data/services/dio/internet_checker.dart';

class PhoneNumberService {
  // phone number verification
  Future<PhoneNumberResponseModel?> phoneNumberVerify(
      PhoneNumberModel data) async {
    if (await internetCheck()) {
      try {
        final response =
            await DioService.postMethod(url: Url.sendOtp, value: data.toJson())
                .timeout(const Duration(seconds: 30), onTimeout: () {
          return null;
        });
        if (response.statusCode >= 200 || response.statusCode <= 299) {
          return PhoneNumberResponseModel.fromJson(response.data);
        } else {
          return null;
        }
      } catch (e) {
        return PhoneNumberResponseModel(message: ApiExceptions.handleError(e));
      }
    } else {
      return PhoneNumberResponseModel(message: "No Internet Connection");
    }
  }

  // otp verification
  Future<OtpResponseModel?> otpverify(OtpModel data) async {
    if (await internetCheck()) {
      try {
        final response = await DioService.postMethod(
            url: Url.otpVerify, value: data.toJson());
        if (response.statusCode >= 200 || response.statusCode <= 299) {
          return OtpResponseModel.fromJson(response.data);
        } else {
          return response.data;
        }
      } catch (e) {
        return OtpResponseModel(message: ApiExceptions.handleError(e));
      }
    } else {
      return OtpResponseModel(message: "No Internet Connection");
    }
  }
}
