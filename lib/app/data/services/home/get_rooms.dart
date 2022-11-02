import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hotel_app/app/core/strings.dart';
import 'package:hotel_app/app/data/models/home/getallrooms.dart';
import 'package:hotel_app/app/data/models/home/response.dart';
import 'package:hotel_app/app/data/services/dio/api_exceptions.dart';
import 'package:hotel_app/app/data/services/dio/dio_service.dart';
import 'package:hotel_app/app/data/services/dio/internet_checker.dart';

class GetAllRoomsService {
  Future<AllRoomsResponse?> getAllRooms() async {
    if (await internetCheck()) {
      try {
        final Response response =
            await DioService.getMethod(url: Url.getAllRooms);
        if (response.statusCode! >= 200 || response.statusCode! <= 299) {
          final dataList = (response.data as List).map((e) {
            return AllRoomsModel.fromJson(e);
          }).toList();
          return AllRoomsResponse(dataList: dataList);
        } else {
          return AllRoomsResponse(
              isFailed: true,
              errormessage: 'Something went wrong ! Please try again later');
        }
      } catch (e) {
        return AllRoomsResponse(
            isFailed: true, errormessage: ApiExceptions.handleError(e));
      }
    } else {
      await Future.delayed(const Duration(seconds: 1));
      return null;
    }
  }
}
