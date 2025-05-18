import 'package:flutter/material.dart';
import 'package:salons/core/utils/prefs_operator.dart';
import 'package:salons/locator.dart';

class OnBoardingProvider extends ChangeNotifier {
  final PrefsOperator _prefsOperator = locator.get<PrefsOperator>();

  bool _hasSeenOnboarding = false;
  bool get hasSeenOnboarding => _hasSeenOnboarding;
  bool _isGetstarted = false;
  bool get isGetStarted => _isGetstarted;
  void changeGetStarted(bool status) {
    _isGetstarted = status;
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    _hasSeenOnboarding = true;
    await _prefsOperator.setOnboardingSeen(true);
    notifyListeners();
  }
}
