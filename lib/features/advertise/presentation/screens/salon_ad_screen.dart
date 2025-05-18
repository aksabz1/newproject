import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/routes/routes.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/features/advertise/presentation/widgets/add_comment_widget.dart';
import 'package:salons/core/widgets/calendar.dart';
import 'package:salons/features/advertise/presentation/widgets/comment_widget.dart';
import 'package:salons/core/widgets/modal.dart';
import 'package:salons/core/widgets/reservation_card.dart';
import 'package:salons/core/widgets/seat_selection_guide.dart';
import 'package:salons/core/widgets/show_salon_services.dart';

class SalonAdScreen extends StatelessWidget {
  const SalonAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.12),
                      Colors.white,
                    ],
                    stops: const [0, 0.3],
                  ).createShader(bounds);
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Image(
                    image: AssetImage("assets/images/arayes1.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
          Container(
            height: .80.sh,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Gap(20.w),
                        const Text('سالن تيراژه'),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('کرج، حصارک، بلوار امام خمینی'),
                            Icon(
                              Icons.location_on_outlined,
                              color: ColorManager.perpel,
                              size: 30,
                            ),
                          ],
                        ),
                        Gap(5.w),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('8 - 22'),
                            Icon(
                              Icons.watch_later_outlined,
                              color: ColorManager.perpel,
                              size: 30,
                            ),
                          ],
                        ),
                        Gap(5.w),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('10.000 - 120.000'),
                            Icon(
                              Icons.attach_money,
                              color: ColorManager.perpel,
                              size: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              body: const AdInfoTabBar(),
            ),
          ),
          Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: Positioned(
              top: .18.sh,
              child: Container(
                height: 35.w,
                width: 160.w,
                decoration: BoxDecoration(
                  color: ColorManager.perpel,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Gap(10.w),
                    const Icon(Icons.star_border, color: Colors.white),
                    const Text(
                      '4.3',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const Spacer(),
                    const Text(
                      'امتياز',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const Text(
                      ' 10',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Gap(10.w),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            width: 1.sw,
            top: .1.sw,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40.w,
                    width: 40.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.white,
                    ),
                    child: const Icon(
                      Icons.share_outlined,
                      color: ColorManager.perpel,
                    ),
                  ),
                  Gap(10.w),
                  Container(
                    height: 40.w,
                    width: 40.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.white,
                    ),
                    child: const Icon(
                      Icons.bookmark_outline,
                      color: ColorManager.perpel,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, Routes.mainRoute),
                    child: Container(
                      height: 40.w,
                      width: 40.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.white,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_outlined,
                        color: ColorManager.perpel,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.chatRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.perpel,
                    minimumSize: Size(.40.sw, 40.w),
                  ),
                  child: Text(
                    'چت',
                    style: getBoldStyle16(color: ColorManager.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showCustomModalBottomSheet(
                      context: context,
                      builder: (context) => CustomModal(
                        height: .41.sh,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 50,
                          ),
                          child: const Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(9.0),
                                    child: Text(
                                      'اطلاعات تماس',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '  تماس تلفنی با  ۰۹۳۵۶۹۲۸۰۰۸',
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(9.0),
                                    child: Icon(Icons.phone,
                                        color: ColorManager.black, size: 25),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '  ارسال پیامک به ۰۹۳۵۶۹۲۸۰۰۸',
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(9.0),
                                    child: Icon(Icons.message_outlined,
                                        color: ColorManager.black, size: 25),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'چت',
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(9.0),
                                    child: Icon(Icons.chat,
                                        color: ColorManager.black, size: 25),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'نشان کن تا بعدا تماس بگیرم',
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(9.0),
                                    child: Icon(Icons.bookmark_add_outlined,
                                        color: ColorManager.black, size: 25),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.perpel,
                    minimumSize: Size(.40.sw, 40.w),
                  ),
                  child: const Text(
                    'اطلاعات تماس',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AdInfoTabBar extends StatefulWidget {
  const AdInfoTabBar({super.key});

  @override
  State<AdInfoTabBar> createState() => _AdInfoTabBarState();
}

class _AdInfoTabBarState extends State<AdInfoTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          TabBar(
            labelPadding: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(top: 15),
            controller: _tabController,
            tabs: const [
              Text('توضیحات'),
              Text('رزرو'),
              Text('خدمات'),
              Text('نظرات')
            ],
          ),
          Gap(10.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    color: Colors.white30,
                    height: 300,
                    child: Text(
                      '''
                  سالن آرایشی "تیراژه" با متراژی شیک و مناسب به مشتریان خود خدمات ارائه می‌دهد. این سالن دارای امکانات مدرن از جمله دستگاه‌های پیشرفته آرایشی و زیبایی مانند دستگاه‌های ماساژر صورت، دستگاه‌های اپیلاسیون برای حذف موهای زائد، و دستگاه‌های اپیلاسیون پوست برای پاکسازی و تازه کردن پوست است. این امکانات همراه با دستاوردهای حرفه‌ای کادر متخصص، تجربه‌ای لذت‌بخش و به یادماندنی برای مشتریان فراهم می‌آورند.
                  ''',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      style: getLightStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: CustomScrollView(
                        slivers: [
                          const SliverToBoxAdapter(
                            child: Column(
                              children: [
                                Calendar(),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: SeatSelectionGuide(),
                                ),
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                              child: Column(
                                children: [
                                  const ReservationItems(),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorManager.perpel,
                                          minimumSize: Size(150.w, 40.w),
                                        ),
                                        child: const Text(
                                          'ثبت',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverGap(60.w)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ShowSalonServices(
                            beauticianName: 'سودابه رنجیر',
                            serviceName: 'مو',
                          ),
                          Divider(),
                          ShowSalonServices(
                            beauticianName: 'زهرا رضایی',
                            serviceName: 'پوست',
                          ),
                          Gap(100),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const AddCommentWidget(),
                          Gap(15.w),
                          const CommentWidget(),
                          Gap(10.w),
                          const CommentWidget(),
                          Gap(10.w),
                          const CommentWidget(),
                          Gap(10.w),
                          const CommentWidget(),
                          Gap(10.w),
                          const CommentWidget(),
                          Gap(100.w),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
