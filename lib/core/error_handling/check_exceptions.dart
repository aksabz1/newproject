
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../features/authentication/data/datasource/auth_api_provider.dart';
import '../../locator.dart';
import '../utils/error_handling/data_state.dart';

class CheckExceptions {
  CheckExceptions(Object? error);


  static Future<DataFailed> response(Response? response) async {
    switch (response?.statusCode ?? -1) {
      case 400:
      case 404:
        return DataFailed(response?.data['message'] ?? "اطلاعات ارسالی اشتباه میباشد");
      case 429:
        return const DataFailed("کمی دیگر دوباره تلاش کنید");
      // case 401:
      //
      //   AuthApiProvider apiProvider = locator<AuthApiProvider>();
      //   /// call refresh token
      //   try{
      //     // Response refreshResponse = await apiProvider.callRefreshToken();
      //     if (kDebugMode) {
      //       print("call again sent");
      //     }
      //     return const DataFailed("", errorStatus: ErrorStatus.again);
      //   }on Exception catch(e){
      //     if (kDebugMode) {
      //       print("call again ${e.toString()}");
      //     }
      //     return const DataFailed("لطفا دوباره وارد شوید.", errorStatus: ErrorStatus.logout);
      //   }
        case 500:
        return DataFailed(response?.data['message'] ?? "سرور در دسترس نمیباشد. دوباره امتحان کنید");
      default:
        if(response != null){
          return DataFailed(response.data['message'] ?? "اینترنت خود را بررسی کنید");
        }else{
          return const DataFailed("اینترنت خود را بررسی کنید");
        }
    }
  }

  static Future<DataState> getError(Object error) async {
    if(error is DioException){
      if (kDebugMode) {
        print(error.response?.data ?? "");
        print(error.requestOptions.path ?? "");
        print(error.message ?? "");
      }
      return response(error.response);
    }else{
      if (kDebugMode) {
        print(error.toString());
      }
      return const DataFailed("مشكلي پیش آمده");
    }
  }
}