import 'package:dio/dio.dart';
import 'package:salons/core/utils/error_handling/data_state.dart';
import 'package:salons/features/authentication/data/datasource/auth_api_provider.dart';
import 'package:salons/features/authentication/data/models/code_model.dart';
import 'package:salons/features/authentication/data/models/login_with_sms_model.dart';

import '../../../core/error_handling/check_exceptions.dart';

class AuthRepository {
  final AuthApiProvider apiProvider;

  AuthRepository({required this.apiProvider});

  Future<DataState<dynamic>> fetchRegisterCodeCheckData(
      mobile) async {
    try {
      Response response = await apiProvider.callRegisterCodeCheck(mobile);
      if (response.data['status'].toString() == "success") {
        // convert json to models class
        final LoginWithSmsModel loginWithSmsModel =
            LoginWithSmsModel.fromJson(response.data);
        return DataSuccess(loginWithSmsModel);
      } else {
        return DataFailed(response.data["message"]);
      }
    } catch(e) {
      return CheckExceptions.getError(e);
    }
  }

  Future<DataState<dynamic>> fetchCodeCheckData(code) async {
    try {
      Response response = await apiProvider.callCodeCheck(code);
      final CodeModel codeModel = CodeModel.fromJson(response.data);
      return DataSuccess(codeModel);
    } catch (e) {
      return CheckExceptions.getError(e);
    }
  }
}
