import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationTime {
  int time;
  bool isAvailable;

  ReservationTime({required this.time, this.isAvailable = true});
}

class AppointmentProvider extends ChangeNotifier {
  final List<ReservationTime> _reservationTimes = [
    ReservationTime(time: 8),
    ReservationTime(time: 9),
    ReservationTime(time: 10),
    ReservationTime(time: 11),
    ReservationTime(time: 12),
    ReservationTime(time: 13),
    ReservationTime(time: 14),
    ReservationTime(time: 15),
    ReservationTime(time: 16),
    ReservationTime(time: 17),
    ReservationTime(time: 18),
    ReservationTime(time: 19),
    ReservationTime(time: 20),
    ReservationTime(time: 21),
    ReservationTime(time: 22),
  ];
  final Set<int> _selectedTimeIndices = {};

  int? _startIndex = 0;
  int? _endIndex = 15;
  List<ReservationTime> get reservationTimes => _reservationTimes;
  List<int> get selectedIndices => _selectedTimeIndices.toList();
  int? get selectedIndex => _reservationTimes
      .indexWhere((time) => time.isAvailable && time.time == _currentIndex);
  int? _currentIndex;
  get strtIndex => _startIndex;
  get endIndex => _endIndex;

  void setLowerUnavilableTime(int index) {
    _startIndex = index;
    for (int i = 0; i < index; i++) {
      _reservationTimes[i].isAvailable = false;
    }
    for (int i = index; i < endIndex; i++) {
      _reservationTimes[i].isAvailable = true;
    }
    notifyListeners();
  }

  void setUpperUnavilableTime(int index) {
    _endIndex = index;
    for (int i = ++index; i < _reservationTimes.length; i++) {
      _reservationTimes[i].isAvailable = false;
    }
    for (int i = strtIndex; i < index; i++) {
      _reservationTimes[i].isAvailable = true;
    }
    notifyListeners();
  }

  void selectTime(int index, BuildContext context) {
    if (_reservationTimes[index].isAvailable) {
      if (_selectedTimeIndices.contains(index)) {
        _selectedTimeIndices.remove(index);
      } else {
        _selectedTimeIndices.add(index);
      }
      notifyListeners();
    } else {
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(10),
        elevation: 0,
        duration: const Duration(seconds: 1),
        content: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 250.w,
          height: 45.w,
          child: const Center(child: Text('این زمان قبلا رزرو شده است!')),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
