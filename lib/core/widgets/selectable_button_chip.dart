import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salons/core/provider/select_role_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';

class SelectableButtonChip extends StatelessWidget {
  const SelectableButtonChip(
      {super.key, required this.labels, required this.index});
  final List labels;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectRoleProvider>(
        builder: (context, selectionProvider, _) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.w),
        child: ChoiceChip(
          label: SizedBox(
            width: 170.w,
            height: 25.w,
            child: Center(
              child: Text(
                labels[index],
                style: getBoldStyle(
                  color: ColorManager.black,
                ),
              ),
            ),
          ),
          showCheckmark: false,
          selected: selectionProvider.selectedIndex == index,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          selectedColor: ColorManager.perpel,
          onSelected: (bool selected) {
            Provider.of<SelectRoleProvider>(context, listen: false)
                .selectedIndex = selected ? index : null;
          },
        ),
      );
    });
  }
}
