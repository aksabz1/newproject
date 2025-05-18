import 'package:flutter/foundation.dart';
import 'package:salons/features/onboarding/repositories/connection_repository.dart';
import 'package:salons/locator.dart';

class ConnetctionProvider extends ChangeNotifier {
  final ConnetctionRepository _connetctionRepository =
      locator.get<ConnetctionRepository>();
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  void checkConnection() async {
    _isConnected = await _connetctionRepository.checkConnection();
    notifyListeners();
  }
}
