import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/core/utils/validation_manager.dart';

class NameField extends StatelessWidget {
  const NameField({super.key});

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
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 11) {
                      FocusScope.of(context).unfocus();
                    }
                  },
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                  ],
                  style: getBoldStyle(color: ColorManager.black, fontSize: 14),
                  decoration: const InputDecoration(
                    isDense: true,
                  ),
                  validator: Validator.apply(
                    context,
                    [
                      RequiredValidation(),
                      MinLengthValidation(),
                    ],
                  ),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                ),
              ),
            ),
          ),
          const Text('نام و نام خانوادگی'),
        ],
      ),
    );
  }
}
