import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/advertise/presentation/provider/booking_or_create_ad_provider.dart';
import 'package:salons/core/provider/select_role_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/routes/routes.dart';
import 'package:salons/features/main/presentation/widgets/exit_widget.dart';
import 'package:salons/core/widgets/modal.dart';
import 'package:salons/core/widgets/selectable_button_chip.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width / 3),
              width: size.width,
              child: Column(
                children: [
                  Gap(20.w),
                  Image.asset('assets/images/avatar 1.png'),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '09121952698',
                      ),
                    ],
                  ),
                  const Gap(20),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                child: Text(
                  textAlign: TextAlign.justify,
                  '''اگر صاحب یکی از  انواع کسب وکارهای موجود در این برنامه هستید یعنی آرایشگر یا سالن دار هستید یا حرفه ای در حوزه ی آرایشگری دارید که مایلید خدمات ارايه دهید  . کسب و کار خود را در برنامه ی ما ثبت نمایید .  
            ''',
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showCustomModalBottomSheet(
                  context: context,
                  builder: (context) => Consumer<BookingOrCreateAdProvider>(
                      builder: (context, bookingOrCreateAdProvider, _) {
                    return CustomModal(
                      height: 0.3.sh,
                      child: Column(
                        children: [
                          Gap(20.w),
                          SizedBox(
                            height: 150.w,
                            child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) =>
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
                              var selectedIndex =
                                  Provider.of<SelectRoleProvider>(context,
                                          listen: false)
                                      .selectedIndex;
                              if (selectedIndex == 0) {
                                Navigator.pushNamed(
                                    context, Routes.businessRegistrationRoute);
                              }
                              if (selectedIndex == 1) {
                                Navigator.pushNamed(
                                    context, Routes.businessRegistrationRoute);
                              }
                              if (selectedIndex != null) {}
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.perpel,
                              minimumSize: Size(200.w, 40.w),
                            ),
                            child: const Text(
                              'ثبت',
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200.w, 45.w),
              ),
              child: const Text(
                'ثبت کسب و کار',
              ),
            ),
            const Gap(10),
            const Divider(),
            const SubTitleWidget(
              routeName: Routes.editInfoRoute,
              title: 'ویرایش اطلاعات',
              icon: Icons.edit_document,
            ),
            const SubTitleWidget(
              routeName: Routes.reservationManagement,
              title: 'مدیریت تقویم',
              icon: Icons.calendar_month,
            ),
            const SubTitleWidget(
              routeName: Routes.bookmark,
              title: 'نشان ها',
              icon: Icons.bookmark,
            ),
            const SubTitleWidget(
              routeName: Routes.subscription,
              title: 'اشتراک های من',
              icon: Icons.calendar_today_outlined,
            ),
            const SubTitleWidget(
              routeName: Routes.myAds,
              title: 'آگهی های من',
              icon: Icons.business_center,
            ),
            const SubTitleWidget(
              routeName: Routes.myAds,
              title: 'چت با پشتیبانی',
              icon: Icons.support_agent_rounded,
            ),
            const SubTitleWidget(
              routeName: Routes.faqRoute,
              title: 'سوالات متداول',
              icon: Icons.question_mark_sharp,
            ),
            GestureDetector(
              onTap: () => {
                showCustomModalBottomSheet(
                  context: context,
                  builder: (context) => CustomModal(
                    height: 0.2.sh,
                    child: const ExitWidget(),
                  ),
                )
              },
              child: Container(
                margin: const EdgeInsets.all(1.5),
                padding: const EdgeInsets.all(1.5),
                width: size.width,
                height: size.height / 15,
                alignment: Alignment.center,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'خروج',
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.exit_to_app,
                          color: ColorManager.perpel, size: 28),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({
    super.key,
    required this.routeName,
    required this.title,
    required this.icon,
  });
  final String routeName;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, routeName)},
      child: Container(
        margin: const EdgeInsets.all(1.5),
        padding: const EdgeInsets.all(1.5),
        width: double.infinity,
        height: 1.sh / 15,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, color: ColorManager.perpel, size: 28),
            ),
          ],
        ),
      ),
    );
  }
}
