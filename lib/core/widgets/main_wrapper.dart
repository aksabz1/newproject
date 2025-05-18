import 'package:flutter/material.dart';
import 'package:salons/core/constants/showcase_keys.dart';
import 'package:salons/core/widgets/bottom_nav.dart';
import 'package:salons/features/main/presentation/screens/messages.dart';
import 'package:salons/features/main/presentation/screens/home_screen.dart';
import 'package:salons/features/main/presentation/screens/profile_screen.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:showcaseview/showcaseview.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          const Messages(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Showcase(
        key: ShowcaseKeys.five,
        titleTextDirection: TextDirection.rtl,
        descriptionTextDirection: TextDirection.rtl,
        description:
            'با رفتن به صفحه پروفایل کسب و کار خود را ثبت و از امکانات بیشتر اپ لذت ببرید.',
        tooltipBackgroundColor: ColorManager.perpel,
        textColor: Colors.white,
        child: BottomNav(
          controller: pageController,
        ),
      ),
    );
  }
}
