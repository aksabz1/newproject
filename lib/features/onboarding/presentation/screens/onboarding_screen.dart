import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/onboarding/presentation/provider/onborading_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/routes/routes.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: .6.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(
                    180,
                  ),
                ),
                color: ColorManager.perpel,
              ),
            ),
          ),
          Positioned(
            top: .1.sh,
            child: SizedBox(
              height: .9.sh,
              width: 1.sw,
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  Provider.of<OnBoardingProvider>(context, listen: false)
                      .changeGetStarted(false);
                  if (value == 2) {
                    Provider.of<OnBoardingProvider>(context, listen: false)
                        .changeGetStarted(true);
                  }
                },
                children: const [
                  IntroPage(
                      title: 'به زیباشو خوش آمدید',
                      description:
                          'چه سالن دار باشید و چه آرایشگر، زیباشو راهی ساده برای مدیریت رزروها و تبلیغ خدمات شما فراهم می‌کند!',
                      image: 'assets/images/onboarding_logo1.png'),
                  IntroPage(
                      title: 'مدیریت ساده نوبت‌ها',
                      description:
                          'به راحتی نوبت‌های سالن را رزرو و مدیریت کنید. زمان های موجود را مرور و زمان دلخواه خود را انتخاب نمایید.',
                      image: 'assets/images/time.png'),
                  IntroPage(
                      title: 'کسب و کار خود را تقویت کنید',
                      description:
                          'تبلیغات زیبا برای خدمات زیبایی خود ایجاد و به اشتراک بگذارید. با استفاده از ابزارهای تبلیغاتی قدرتمند ما، مشتریان بیشتری جذب کنید و کسب و کار خود را به راحتی رشد دهید.',
                      image: 'assets/images/business.png'),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.07.sh,
            right: 20,
            child: DelayedWidget(
              delayDuration: const Duration(milliseconds: 500),
              animationDuration: const Duration(seconds: 1),
              animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
              child: SizedBox(
                height: 45,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.perpel,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);

                    if (pageController.page!.toInt() == 2) {
                      Provider.of<OnBoardingProvider>(context, listen: false)
                          .changeGetStarted(true);
                      context.read<OnBoardingProvider>().completeOnboarding();
                      Navigator.pushNamed(context, Routes.loginRoute);
                    }
                  },
                  child: Consumer<OnBoardingProvider>(
                    builder: (context, provider, _) {
                      return Text(
                        provider.isGetStarted ? 'شروع کنید' : 'ورق بزنید',
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.09.sh,
            left: 30,
            child: DelayedWidget(
              delayDuration: const Duration(milliseconds: 300),
              animationDuration: const Duration(seconds: 1),
              animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 5,
                    activeDotColor: ColorManager.perpel),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const IntroPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 0.4.sh,
          child: DelayedWidget(
            delayDuration: const Duration(milliseconds: 200),
            animationDuration: const Duration(seconds: 1),
            animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
            child: Center(child: Image.asset(image)),
          ),
        ),
        const Gap(120),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: DelayedWidget(
            delayDuration: const Duration(milliseconds: 400),
            animationDuration: const Duration(seconds: 1),
            animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
            child: Text(
              title,
              textDirection: TextDirection.rtl,
              style: getBoldStyle16(color: ColorManager.black, fontSize: 25),
            ),
          ),
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: DelayedWidget(
            delayDuration: const Duration(milliseconds: 600),
            animationDuration: const Duration(seconds: 1),
            animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
            child: Text(
              description,
              textDirection: TextDirection.rtl,
              style: getBoldStyle14(color: ColorManager.black),
            ),
          ),
        ),
      ],
    );
  }
}
