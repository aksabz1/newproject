import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/core/widgets/modal.dart';

class SortingModal extends StatelessWidget {
  const SortingModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomModal(
      height: 0.45.sh,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Gap(10.w),
            Center(
              child: Text(
                'مرتب سازی بر اساس',
                style: getBoldStyle16(color: ColorManager.black),
              ),
            ),
            Gap(20.w),
            const Text('گران ترین'),
            const Divider(),
            Gap(20.w),
            const Text('محبوب ترین'),
            const Divider(),
            Gap(20.w),
            const Text('ارزان ترین'),
            const Divider(),
            Gap(20.w),
            const Text('پرتخفیف ترین'),
            const Divider(),
            Gap(20.w),
            const Text('جدید ترین')
          ],
        ),
      ),
    );
  }
}
