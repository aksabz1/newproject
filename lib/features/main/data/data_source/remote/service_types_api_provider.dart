
import 'package:dio/dio.dart';

class ServiceTypesApiProvider {
  Dio dio;
  ServiceTypesApiProvider(this.dio);

  Future<Response> getServiceTypes() async {
    return await dio.get(
        "serviceTypes",
        queryParameters: {
          "serviceId": 1,
          "cityId": 1,
          "page": 0,
          "size": 50,
        }
    );
  }
}