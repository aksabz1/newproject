import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:salons/features/bookmarks/presentation/widgets/ad_bookmaked_card.dart';
import 'package:salons/features/bookmarks/presentation/widgets/profile_bookmarked_card.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ذخیره شده‌ها'),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Text('پروفایل‌ها'),
                  Text('آگهی‌ها'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    CustomScrollView(
                      slivers: [
                        const SliverGap(5),
                        SliverList.builder(
                          itemCount: 6,
                          itemBuilder: (context, index) =>
                              const ProfileBookmarkedCard(),
                        ),
                        const SliverGap(10),
                      ],
                    ),
                    CustomScrollView(
                      slivers: [
                        const SliverGap(5),
                        SliverList.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) =>
                              const AdBookmarkedCard(),
                        ),
                        const SliverGap(10),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
