import 'dart:io';
import 'package:android_sms_retriever/android_sms_retriever.dart';
import 'package:dio/dio.dart';

import '../../../../core/error_handling/check_exceptions.dart';

class AuthApiProvider {
  final Dio dio;
  AuthApiProvider({
    required this.dio,
  });

  dynamic callRegisterCodeCheck(phoneNumber) async {
    try {
      final response = await dio.post(
        "baseUrl/auth/sendcode",
        queryParameters: {
          "mobile": phoneNumber,
          if (Platform.isAndroid)
            'hash': (await AndroidSmsRetriever.getAppSignature())
        },
      );

      return response;
    } on DioException catch (e) {
      return CheckExceptions.response(e.response!);
    }
  }

  dynamic callCodeCheck(code) async {
    try {
      final response =
          await dio.post("baseUrl/auth/loginWithSms/check", queryParameters: {
        "code": code,
      });

      return response;
    } on DioException catch (e) {
      return CheckExceptions.response(e.response!);
    }
  }
}
