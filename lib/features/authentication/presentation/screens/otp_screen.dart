import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/authentication/presentation/provider/login_provider.dart';
import 'package:salons/features/authentication/presentation/provider/otp_provider.dart';
import 'package:salons/core/utils/assets_manager.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/routes/routes.dart';
import 'package:salons/core/utils/styles_manager.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<OTPProvider>(builder: (context, otpProvider, child) {
            return Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: .4.sw,
                  child: const Image(
                    image: AssetImage(ImageAssets.splashLogo),
                  ),
                ),
                Gap(100.w),
                Text(
                  'ارسال کد به شماره: ${Provider.of<LoginProvider>(context).phoneNumber}',
                ),
                Gap(10.w),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.loginRoute);
                    otpProvider.resetTimer();
                  },
                  child: const Text('ویرایش شماره'),
                ),
                OtpTextField(
                  numberOfFields: 5,
                  borderWidth: 3,
                  fieldWidth: 50.w,
                  showFieldAsBox: true,
                  textStyle:
                      getBoldStyle(color: ColorManager.black, fontSize: 14.sp),
                  borderRadius: BorderRadius.circular(10),
                  onSubmit: (value) {
                    Provider.of<OTPProvider>(context, listen: false)
                        .setOTPCodeEntered(true);
                  },
                  onCodeChanged: (value) {
                    Provider.of<OTPProvider>(context, listen: false)
                        .setOTPCodeEntered(false);
                  },
                ),
                Gap(20.w),
                Visibility(
                  visible: !otpProvider.isTimerRunning,
                  child: TextButton(
                      onPressed: () {
                        otpProvider.resetTimer();
                      },
                      child: const Text('ارسال مجدد کد')),
                ),
                Visibility(
                  visible: otpProvider.isTimerRunning,
                  child: Text(
                    'ارسال مجدد کد: ${otpProvider.start} ثانیه',
                    style: getBoldStyle(
                      color: ColorManager.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                Gap(20.w),
                ElevatedButton(
                  onPressed: otpProvider.isOTPCodeEntered
                      ? () {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.mainRoute);
                          otpProvider.dispose();
                          context.read<LoginProvider>().login();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200.w, 45.w),
                  ),
                  child: Text(
                    'تائید',
                    style: getBoldStyle(
                      color: ColorManager.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
