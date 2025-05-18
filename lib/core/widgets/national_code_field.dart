import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salons/core/utils/validation_manager.dart';

class NationalCodeField extends StatelessWidget {
  const NationalCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 250.w,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: Validator.apply(
                    context,
                    [
                      RequiredValidation(),
                      NationalIdValidation(),
                    ],
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: const InputDecoration(
                    hintText: '',
                    hintTextDirection: TextDirection.ltr,
                    isDense: true,
                  ),
                ),
              ),
            ),
          ),
          const Text('كد ملی'),
        ],
      ),
    );
  }
}
