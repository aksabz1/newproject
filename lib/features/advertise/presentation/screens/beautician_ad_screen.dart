import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/routes/routes.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/features/advertise/presentation/widgets/add_comment_widget.dart';
import 'package:salons/features/advertise/presentation/widgets/comment_widget.dart';
import 'package:salons/core/widgets/modal.dart';

class BeauticianAdScreen extends StatelessWidget {
  const BeauticianAdScreen({super.key});

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
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gap(20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            Text('کاشت ناخن'),
                            Image(
                              image: AssetImage("assets/images/nail1.png"),
                              fit: BoxFit.cover,
                              width: 30,
                            ),
                            Spacer(),
                            Text('زهرا معینی'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
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
                      ),
                      Gap(10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('توضیحات'),
                          ],
                        ),
                      ),
                      Gap(10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                ''
                                'سلام زهرا هستم  ۲ سال طراحی ناخن میکنم . عاشق کارم هستم و شاید بهترین طراح نباشم اما طرح با کیفیت و شیکی رو حتما تحویل تون میدم . ...'
                                '',
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('خدمات'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 15),
                      child: Container(
                        height: 50.w,
                        width: .9.sw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorManager.perpel,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '120 - 40 تومان',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: ColorManager.perpel,
                                  fontSize: 14,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'مانیکور دست',
                                style:
                                    getBoldStyle16(color: ColorManager.perpel),
                              ),
                              const Gap(5),
                              const Image(
                                image: AssetImage("assets/images/nail1.png"),
                                fit: BoxFit.cover,
                                width: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    childCount: 4,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gap(50),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          color: ColorManager.perpel,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('مشاهده همه'),
                            Text('نظرات'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10,
                      ),
                      child: AddCommentWidget(),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 6,
                    (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 5,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: CommentWidget(),
                      ),
                    ),
                  ),
                ),
                const SliverGap(100)
              ],
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
