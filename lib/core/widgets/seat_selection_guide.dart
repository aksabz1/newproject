import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';

class SeatSelectionGuide extends StatelessWidget {
  const SeatSelectionGuide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 30.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Colors.red,
                        width: 8.w,
                      ),
                    ),
                  ),
                ),
                Gap(5.w),
                Text(
                  'رزرو شده',
                  style: getBoldStyle(color: ColorManager.black),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(
                        color: ColorManager.perpel,
                        width: 8.w,
                      ),
                    ),
                  ),
                ),
                Gap(5.w),
                Text(
                  'انتخاب شده',
                  style: getBoldStyle(color: ColorManager.black),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Colors.greenAccent,
                        width: 8.w,
                      ),
                    ),
                  ),
                ),
                Gap(5.w),
                Text(
                  'در دسترس',
                  style: getBoldStyle(color: ColorManager.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
