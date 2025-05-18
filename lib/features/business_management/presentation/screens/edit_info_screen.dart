import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/core/provider/select_role_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/core/widgets/beautician_edit_info_form_field.dart';
import 'package:salons/core/widgets/name_field.dart';
import 'package:salons/core/widgets/phone_field.dart';
import 'package:salons/core/widgets/salon_owner_edit_info_form_field.dart';

class EditInfoScreen extends StatelessWidget {
  const EditInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ویرایش اطلاعات'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Container(
                height: 180.r,
                width: 180.r,
                decoration: const BoxDecoration(
                  color: ColorManager.perpel,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const Gap(10),
            const NameField(),
            const Gap(5),
            const PhoneField(),
            const Gap(5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  2,
                  (index) => Consumer<SelectRoleProvider>(
                    builder: (context, provider, _) {
                      return ChoiceChip(
                        label: SizedBox(
                          width: 140.w,
                          height: 25.w,
                          child: Center(
                            child: Text(
                              provider.roles[index] ?? '',
                              style: getBoldStyle(
                                color: ColorManager.black,
                              ),
                            ),
                          ),
                        ),
                        showCheckmark: false,
                        selected: provider.selectedIndex == index,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        selectedColor: ColorManager.perpel,
                        onSelected: (bool selected) {
                          Provider.of<SelectRoleProvider>(context,
                                  listen: false)
                              .selectedIndex = selected ? index : null;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            const Gap(10),
            Consumer<SelectRoleProvider>(
              builder: (context, provider, child) {
                if (provider.selectedIndex == 0) {
                  return const BeauticianEditInfoFormFields();
                }
                if (provider.selectedIndex == 1) {
                  return const SalonOwnerEditInfoFormFields();
                }
                return const SizedBox();
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
              child: Row(
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
            )
          ],
        ),
      ),
    );
  }
}
