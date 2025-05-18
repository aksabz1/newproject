import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnetctionRepository {
  Future<bool> checkConnection() async {
    try {
      bool isConnected = await InternetConnectionChecker().hasConnection;

      return isConnected;
    } catch (e) {
      return false;
    }
  }
}
