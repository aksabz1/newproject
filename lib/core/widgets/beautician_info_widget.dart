import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/core/utils/validation_manager.dart';

class BeauticianInfoWidget extends StatelessWidget {
  const BeauticianInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
      child: Column(
        children: [
          Row(
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
                      style:
                          getBoldStyle(color: ColorManager.black, fontSize: 14),
                      decoration: const InputDecoration(
                        hintText: 'سودابه رنجبر',
                        hintTextDirection: TextDirection.rtl,
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
              const Text(
                'نام آرایشگر',
                style: TextStyle(
                  fontSize: 14,
                  color: ColorManager.grey,
                ),
              ),
            ],
          ),
          const Gap(20),
          Row(
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
                    style:
                        getBoldStyle(color: ColorManager.black, fontSize: 14),
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
                    validator: Validator.apply(
                      context,
                      [
                        PhoneNumberValidation(),
                      ],
                    ),
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  ),
                ),
              ),
              const Text(
                'موبایل آرایشگر',
                style: TextStyle(
                  fontSize: 14,
                  color: ColorManager.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
