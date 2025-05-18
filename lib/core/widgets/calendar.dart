import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persian_horizontal_date_picker/persian_horizontal_date_picker.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370.w,
      child: PersianHorizontalDatePicker(
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 2)),
        initialSelectedDate: DateTime.now(),
        onDateSelected: (date) {},
        datePickerHeight: 95.w,
        width: 105.w,
        radius: 20,
        selectedDayTextStyle: getBoldStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        selectedWeekDayTextStyle: getBoldStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        selectedMonthTextStyle: getBoldStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        dayTextStyle: getBoldStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        weekDayTextStyle: getBoldStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        monthTextStyle: getBoldStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        textColor: Colors.white,
        backgroundColor: ColorManager.perpel.withOpacity(.4),
        selectedBackgroundColor: ColorManager.perpel,
      ),
    );
  }
}