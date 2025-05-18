import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/appointment_management/presentation/provider/appointment_provider.dart';
import 'package:salons/core/utils/color_manager.dart';

class ReservationItems extends StatelessWidget {
  const ReservationItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentProvider>(
      builder: (context, reservationProvider, _) {
        return SizedBox(
          height: 430.w,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 10.w,
              childAspectRatio: 1.75 / 1,
            ),
            itemBuilder: (context, index) => ChoiceChip(
              showCheckmark: false,
              label: SizedBox(
                height: 40.w,
                child: Center(
                  child: Text(
                    '${reservationProvider.reservationTimes[index].time}:00',
                  ),
                ),
              ),
              selected: reservationProvider.selectedIndices.contains(index),
              shape: RoundedRectangleBorder(
                side: const BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.circular(10),
              ),
              selectedColor: ColorManager.perpel,
              backgroundColor:
                  reservationProvider.reservationTimes[index].isAvailable
                      ? Colors.greenAccent
                      : Colors.red,
              onSelected: (value) {
                Provider.of<AppointmentProvider>(context, listen: false)
                    .selectTime(index, context);
              },
            ),
            itemCount: reservationProvider.reservationTimes.length,
          ),
        );
      },
    );
  }
}
