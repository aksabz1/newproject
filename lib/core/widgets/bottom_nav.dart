import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salons/core/provider/buttom_nav_provider.dart';
import 'package:salons/core/utils/color_manager.dart';

class BottomNav extends StatelessWidget {
  final PageController controller;

  const BottomNav({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Consumer<ButtomNavProvider>(builder: (context, provider, _) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavyBar(
          selectedIndex: provider.currentIndex,
          itemPadding: const EdgeInsets.symmetric(horizontal: 15),
          onItemSelected: (index) {
            controller.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
            provider.changeSelectedIndex(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              title: const Text('خانه'),
              icon: const Icon(Icons.home),
              activeColor: ColorManager.perpel,
              inactiveColor: ColorManager.grey,
            ),
            BottomNavyBarItem(
              title: const Text(
                'پیام ها',
              ),
              icon: const Icon(Icons.question_answer),
              activeColor: ColorManager.perpel,
              inactiveColor: ColorManager.grey,
            ),
            BottomNavyBarItem(
              title: const Text('پروفایل'),
              icon: const Icon(Icons.person),
              activeColor: ColorManager.perpel,
              inactiveColor: ColorManager.grey,
            ),
          ],
        ),
      );
    });
  }
}
