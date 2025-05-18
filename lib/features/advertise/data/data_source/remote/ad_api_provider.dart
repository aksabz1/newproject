
import 'package:dio/dio.dart';

class AdApiProvider {
  Dio dio;
  AdApiProvider(this.dio);

  Future<Response> getAdvertisements() async {
    return await dio.get(
        "advertisements",
      queryParameters: {
          "serviceId": 1,
        "cityId": 1,
        "page": 0,
        "size": 50,
      }
    );
  }
}