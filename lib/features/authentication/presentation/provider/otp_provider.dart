import 'package:flutter/material.dart';
import 'dart:async';

class OTPProvider extends ChangeNotifier {
  late Timer _timer;
  int _start = 60;
  bool _isTimerRunning = false;
  bool _isOTPCodeEntered = false;

  int get start => _start;
  bool get isTimerRunning => _isTimerRunning;
  bool get isOTPCodeEntered => _isOTPCodeEntered;

  void startTimer() {
    _isTimerRunning = true;
    notifyListeners();
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_start == 0) {
          timer.cancel();
          _isTimerRunning = false;
          notifyListeners(); // Notify listeners when timer stops
        } else {
          _start--;
          notifyListeners(); // Notify listeners when timer value changes
        }
      },
    );
  }

  void resetTimer() {
    _start = 60;
    startTimer();
  }

  void setOTPCodeEntered(bool value) {
    _isOTPCodeEntered = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
