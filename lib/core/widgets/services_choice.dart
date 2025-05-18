import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/advertise/presentation/provider/services_chip_provider.dart';
import 'package:salons/core/utils/color_manager.dart';

class ServicesChoiceList extends StatelessWidget {
  ServicesChoiceList({super.key, required this.services});
  List<Service> services;

  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesChipProvider>(
        builder: (context, selectionProvider, _) {
      return SizedBox(
          height: 110.w,
          child: ListView.builder(
            itemCount: services.length,
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: Column(
                children: [
                  ChoiceChip(
                    padding: EdgeInsets.zero,
                    showCheckmark: false,
                    label: Container(
                      width: 70.w,
                      height: 70.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9).withOpacity(.4),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          services[index].image,
                          width: 30.w,
                          height: 30.w,
                        ),
                      ),
                    ),
                    selected: selectionProvider.selectedIndex == index,
                    selectedColor: ColorManager.perpel,
                    shape: const CircleBorder(
                      side: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                    onSelected: (bool selected) {
                      Provider.of<ServicesChipProvider>(context, listen: false)
                          .setSelectedIndex(index);
                    },
                  ),
                  Gap(10.w),
                  Text(services[index].name)
                ],
              ),
            ),
          ));
    });
  }
}
