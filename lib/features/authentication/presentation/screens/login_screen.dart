import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/authentication/presentation/provider/login_provider.dart';
import 'package:salons/features/authentication/presentation/provider/otp_provider.dart';
import 'package:salons/core/utils/assets_manager.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/routes/routes.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/core/utils/validation_manager.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:
              Consumer<LoginProvider>(builder: (context, loginProvider, child) {
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
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.w),
                  child: Form(
                    key: loginProvider.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      onChanged: (value) {
                        loginProvider.setPhoneNumber(value);
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
                        labelText: 'شماره موبایل',
                        hintText: '09123456789',
                        labelStyle: getLightStyle(
                            color: ColorManager.grey, fontSize: 16),
                        hintStyle: getBoldStyle(
                          color: ColorManager.lightGrey,
                          fontSize: 14,
                        ),
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
                Gap(50.w),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                          style: const TextStyle(color: ColorManager.black),
                          children: [
                            const TextSpan(
                              text: 'با ثبت نام در زیباشو ',
                            ),
                            TextSpan(
                              text: 'شرایط و قوانین ',
                              style: const TextStyle(
                                color: ColorManager.perpel,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        DraggableScrollableSheet(
                                      expand: false,
                                      initialChildSize: 0.8,
                                      minChildSize: .4,
                                      builder: (context, scrollController) =>
                                          CustomScrollView(
                                        slivers: [
                                          SliverToBoxAdapter(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                children: [
                                                  const Gap(20),
                                                  const Text('قوانین و شرایط'),
                                                  const Gap(20),
                                                  RichText(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    text: const TextSpan(
                                                      style: TextStyle(
                                                        color:
                                                            ColorManager.black,
                                                        fontSize: 16,
                                                        height: 2,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.')
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 0.3.sw,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            ColorManager.perpel,
                                                        minimumSize:
                                                            Size(170.w, 40.w),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          'تایید',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                            ),
                            const TextSpan(
                              text: 'را می پذیرم . ',
                            ),
                          ],
                        ),
                      ),
                      Consumer<LoginProvider>(
                        builder: (context, provider, _) {
                          return Checkbox(
                            value: provider.isAccept,
                            onChanged: (value) {
                              context.read<LoginProvider>().setisAccept();
                            },
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Gap(50),
                ElevatedButton(
                  onPressed: loginProvider.phoneNumber.length == 11 &&
                          loginProvider.isAccept
                      ? () {
                          if (loginProvider.formKey.currentState!.validate()) {
                            Navigator.of(context).pushNamed(Routes.otpRoute);
                            Provider.of<OTPProvider>(context, listen: false)
                                .startTimer();
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200.w, 45.w),
                  ),
                  child: Text(
                    'ارسال کد تایید',
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
