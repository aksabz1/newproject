import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/core/utils/validation_manager.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 250.w,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 11) {
                    FocusScope.of(context).unfocus();
                  }
                },
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                ],
                style: getBoldStyle(color: ColorManager.black, fontSize: 14),
                decoration: InputDecoration(
                  hintText: '0912*******',
                  labelStyle:
                      getLightStyle(color: ColorManager.grey, fontSize: 16),
                  hintStyle: getBoldStyle(
                    color: ColorManager.lightGrey,
                    fontSize: 14,
                  ),
                  isDense: true,
                ),
                validator: Validator.apply(context, [
                  PhoneNumberValidation(),
                ]),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            ),
          ),
          const Text('شماره موبایل'),
        ],
      ),
    );
  }
}
