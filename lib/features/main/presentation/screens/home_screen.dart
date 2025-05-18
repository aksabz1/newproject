import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/core/constants/showcase_keys.dart';
import 'package:salons/features/advertise/presentation/provider/booking_or_create_ad_provider.dart';
import 'package:salons/core/provider/select_role_provider.dart';
import 'package:salons/features/advertise/presentation/provider/services_chip_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/routes/routes.dart';
import 'package:salons/features/main/presentation/widgets/ad_card.dart';
import 'package:salons/features/main/presentation/widgets/filter_drawer.dart';
import 'package:salons/core/widgets/modal.dart';
import 'package:salons/core/widgets/selectable_button_chip.dart';
import 'package:salons/core/widgets/services_choice.dart';
import 'package:salons/features/main/presentation/widgets/sorting_modal.dart';
import 'package:showcaseview/showcaseview.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ServicesChipProvider>(
      create: (context) => ServicesChipProvider(),
      child: Scaffold(
        key: _scaffoldKey,
        endDrawerEnableOpenDragGesture: false,
        endDrawer: const FilterDrawerWdget(),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0.w, vertical: 20.w),
                      child: Showcase(
                        key: ShowcaseKeys.one,
                        titleTextDirection: TextDirection.rtl,
                        descriptionTextDirection: TextDirection.rtl,
                        description:
                            'به راحتی با انتخاب شهر مورد نظر، آگهی‌های مناسب را پیدا کنید.',
                        tooltipBackgroundColor: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: SizedBox(
                              height: .055.sh,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset(
                                    'assets/images/search_Icon.png',
                                    height: 15.w,
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 1,
                                        height: 30.w,
                                        color: ColorManager.grey,
                                      ),
                                      const Gap(10),
                                      SizedBox(
                                          width: 50.w,
                                          child: const Text('کرج')),
                                    ],
                                  ),
                                  hintText: 'جستجو در همه اگهی ها',
                                  hintStyle:
                                      const TextStyle(color: ColorManager.grey),
                                  filled: true,
                                  fillColor:
                                      ColorManager.lightGrey.withOpacity(0.3),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Showcase(
                      targetPadding: const EdgeInsets.all(5),
                      key: ShowcaseKeys.two,
                      titleTextDirection: TextDirection.rtl,
                      descriptionTextDirection: TextDirection.rtl,
                      description:
                          'صندلی مورد نظر خود را رزرو کنید یا به عنوان آرایشگر و سالن‌دار آگهی خود را ثبت کنید.',
                      tooltipBackgroundColor: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: SizedBox(
                          height: 45.w,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                Consumer<BookingOrCreateAdProvider>(builder:
                                    (context, bookingOrCreateAdProvider, _) {
                              return Padding(
                                padding: EdgeInsets.only(right: .05.sw),
                                child: ChoiceChip(
                                  label: SizedBox(
                                    width: .35.sw,
                                    height: 25.w,
                                    child: Center(
                                      child: Text(
                                        bookingOrCreateAdProvider
                                            .labels[index]!,
                                      ),
                                    ),
                                  ),
                                  showCheckmark: false,
                                  selected:
                                      bookingOrCreateAdProvider.selectedIndex ==
                                          index,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  selectedColor: ColorManager.perpel,
                                  onSelected: (bool selected) {
                                    Provider.of<BookingOrCreateAdProvider>(
                                                context,
                                                listen: false)
                                            .selectedIndex =
                                        selected ? index : null;
                                    if (selected && index == 0) {
                                      showCustomModalBottomSheet(
                                        context: context,
                                        builder: (context) => CustomModal(
                                          height: 0.3.sh,
                                          child: Column(
                                            children: [
                                              Gap(20.w),
                                              SizedBox(
                                                height: 150.w,
                                                child: ListView.builder(
                                                  itemCount: 2,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          SelectableButtonChip(
                                                    labels: const [
                                                      'آرایشگر هستم',
                                                      'سالن دار هستم',
                                                    ],
                                                    index: index,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  var selectedIndex = Provider
                                                          .of<SelectRoleProvider>(
                                                              context,
                                                              listen: false)
                                                      .selectedIndex;
                                                  if (selectedIndex == 0) {
                                                    Navigator.pushNamed(context,
                                                        Routes.beauticainForm);
                                                  } else if (selectedIndex !=
                                                      null) {
                                                    Navigator.pushNamed(context,
                                                        Routes.salonOwnerForm);
                                                  }
                                                  context
                                                      .read<
                                                          BookingOrCreateAdProvider>()
                                                      .selectedIndex = null;
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize:
                                                      Size(200.w, 45.w),
                                                ),
                                                child: const Text(
                                                  'ثبت',
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    Gap(5.w)
                  ],
                ),
              ),
              SliverAppBar(
                pinned: true,
                surfaceTintColor: Colors.transparent,
                scrolledUnderElevation: 0,
                elevation: 0,
                automaticallyImplyLeading: false,
                actions: const [SizedBox()],
                toolbarHeight: 15.w,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(150),
                  child: Column(
                    children: [
                      Consumer<ServicesChipProvider>(
                          builder: (context, servicesChipProvider, _) {
                        return ServicesChoiceList(
                          services: servicesChipProvider.services,
                        );
                      }),
                      const Divider(),
                      Showcase(
                        key: ShowcaseKeys.three,
                        titleTextDirection: TextDirection.rtl,
                        descriptionTextDirection: TextDirection.rtl,
                        description:
                            'آگهی‌ها را بر اساس نیاز خود فیلتر کرده و بهترین گزینه را انتخاب کنید.',
                        tooltipBackgroundColor: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        targetPadding: const EdgeInsets.all(5),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.w, horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () => showCustomModalBottomSheet(
                                  context: context,
                                  builder: (context) => const SortingModal(),
                                ),
                                child: const Text(
                                  'محبوب ترین ها',
                                ),
                              ),
                              GestureDetector(
                                onTap: () => showCustomModalBottomSheet(
                                  context: context,
                                  builder: (context) => const SortingModal(),
                                ),
                                child: const Icon(Icons.filter_list_sharp),
                              ),
                              Gap(20.w),
                              GestureDetector(
                                onTap: () =>
                                    _scaffoldKey.currentState?.openEndDrawer(),
                                child: const Text(
                                  'فیلتر',
                                ),
                              ),
                              GestureDetector(
                                  onTap: () => _scaffoldKey.currentState
                                      ?.openEndDrawer(),
                                  child: const Icon(Icons.sort_outlined)),
                              const Spacer(),
                              const Text(
                                'ناخن کارها',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => index == 0
                      ? Showcase(
                          titleTextDirection: TextDirection.rtl,
                          descriptionTextDirection: TextDirection.rtl,
                          key: ShowcaseKeys.four,
                          description:
                              'آگهی های مورد نظر خود را به راحتی مشاهده و مدیریت کنید.',
                          tooltipBackgroundColor:
                              Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          targetPadding: const EdgeInsets.all(5),
                          child: AdCard(index: index),
                        )
                      : AdCard(index: index),
                  childCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
