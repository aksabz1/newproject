import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/business_management/presentation/provider/edit_info_provider.dart';
import 'package:salons/core/utils/color_manager.dart';

class HairServices extends StatelessWidget {
  const HairServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Consumer<EditInfoProvider>(
          builder: (context, provider, _) {
            return Wrap(
              spacing: 10.w,
              children: List.generate(
                provider.hairServices.length,
                (chipIndex) => ChoiceChip(
                  label: Text(
                    provider.hairServices[chipIndex].name,
                    style: TextStyle(
                        color: provider.hairServices[chipIndex].isSelected
                            ? ColorManager.white
                            : ColorManager.perpel),
                  ),
                  showCheckmark: false,
                  selectedColor: ColorManager.perpel,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      side: BorderSide(
                        color: ColorManager.perpel,
                      )),
                  onSelected: (value) {
                    provider.selectHairServices(chipIndex, value);
                  },
                  selected: provider.hairServices[chipIndex].isSelected,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
