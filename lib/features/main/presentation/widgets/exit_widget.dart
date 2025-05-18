
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';

class ExitWidget extends StatelessWidget {
  const ExitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0.w),
          child: Text(
            'آیا مایل به خروج از حساب کاربری خود هستید؟',
            style: getBoldStyle(color: ColorManager.black, fontSize: 16),
          ),
        ),
        const Divider(),
        Gap(15.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150.w, 45.w),
                backgroundColor: ColorManager.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: ColorManager.perpel,
                  ),
                ),
              ),
              child: Text(
                'بله',
                style: getBoldStyle(color: ColorManager.perpel, fontSize: 18),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150.w, 45.w),
                backgroundColor: ColorManager.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: ColorManager.perpel,
                  ),
                ),
              ),
              child: Text(
                'خیر',
                style: getBoldStyle(color: ColorManager.perpel, fontSize: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
