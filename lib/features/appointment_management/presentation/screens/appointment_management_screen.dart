import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/appointment_management/presentation/provider/appointment_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/core/widgets/calendar.dart';
import 'package:salons/core/widgets/reservation_card.dart';
import 'package:salons/core/widgets/seat_selection_guide.dart';

class AppointmentManagementScreen extends StatelessWidget {
  const AppointmentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مدیریت تقویم'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<AppointmentProvider>(
        create: (context) => AppointmentProvider(),
        child: DefaultTabController(
          length: 2,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Text('صندلی 1'),
                    Text('صندلی 2'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const HoursOfWork(),
                            Gap(10.w),
                            const SeatSelectionGuide(),
                            Gap(15.w),
                            const Calendar(),
                            Gap(15.w),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.w, horizontal: 30.w),
                              child: const ReservationItems(),
                            ),
                            const SubmitButton(),
                            Gap(10.w),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Divider(),
                            ),
                            const ReservedTime(),
                            const ReservedTime(),
                            const ReservedTime(),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const HoursOfWork(),
                            Gap(10.w),
                            const SeatSelectionGuide(),
                            Gap(15.w),
                            const Calendar(),
                            Gap(15.w),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.w, horizontal: 30.w),
                              child: const ReservationItems(),
                            ),
                            const SubmitButton(),
                            Gap(10.w),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Divider(),
                            ),
                            const ReservedTime(),
                            const ReservedTime(),
                            const ReservedTime(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReservedTime extends StatelessWidget {
  const ReservedTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 50.w,
        width: .9.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorManager.perpel,
          ),
        ),
        child: Row(
          children: [
            Gap(10.w),
            Text(
              'ساعت 8:00 - 10:00',
              style: getBoldStyle14(
                color: ColorManager.perpel,
              ),
            ),
            Gap(20.w),
            Text(
              'الهه رضایی',
              style: getBoldStyle14(
                color: ColorManager.perpel,
              ),
            ),
            const Spacer(),
            Text(
              'چت',
              style: getBoldStyle16(color: ColorManager.perpel),
            ),
            Gap(10.w),
          ],
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.perpel,
              minimumSize: Size(200.w, 40.w),
            ),
            child: Text(
              'ثبت',
              style: getBoldStyle(
                color: ColorManager.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HoursOfWork extends StatelessWidget {
  const HoursOfWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('ساعت کاری:'),
        Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Container(
              width: 250.w,
              height: 45.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorManager.perpel.withOpacity(0.3),
              ),
            ),
            SizedBox(
              width: 250,
              height: 150,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 120,
                      child: ListWheelScrollView.useDelegate(
                        onSelectedItemChanged: (index) {
                          Provider.of<AppointmentProvider>(context,
                                  listen: false)
                              .setLowerUnavilableTime(index);
                        },
                        physics: const FixedExtentScrollPhysics(),
                        itemExtent: 50,
                        perspective: 0.003,
                        diameterRatio: 1.25,
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 15,
                          builder: (context, index) => Center(
                            child: Text('${index + 8}:00'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'تا',
                    style: getBoldStyle16(color: ColorManager.black),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 120,
                      child: ListWheelScrollView.useDelegate(
                        onSelectedItemChanged: (index) {
                          Provider.of<AppointmentProvider>(context,
                                  listen: false)
                              .setUpperUnavilableTime(index);
                        },
                        physics: const FixedExtentScrollPhysics(),
                        itemExtent: 50,
                        perspective: 0.003,
                        diameterRatio: 1.25,
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 15,
                          builder: (context, index) => Center(
                            child: Text('${index + 8}:00'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
