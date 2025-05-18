import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('آگهی‌های من'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 7,
            itemBuilder: (context, index) => const MyAdCard(),
          )
        ],
      ),
    );
  }
}

class MyAdCard extends StatelessWidget {
  const MyAdCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/salonRoute');
          },
          child: Stack(
            children: [
              Container(
                height: .3.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ColorManager.perpel,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/arayes1.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: const Row(
                              children: [
                                Text(
                                  '4.3 (از 121 نظر)',
                                  textDirection: TextDirection.rtl,
                                ),
                                Icon(
                                  Icons.star,
                                  color: ColorManager.perpel,
                                ),
                                Spacer(),
                                Text('زهرا الیاسی'),
                              ],
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('کرج و عظیمیه'),
                              Icon(
                                Icons.location_on_outlined,
                                color: ColorManager.perpel,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0.w),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '40-120 تومان',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: Color(0xff808080),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'مانیکور دست: ',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: Color(0xff808080),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Image(
                                      image:
                                          AssetImage('assets/images/nail.png'),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '40-120 تومان',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: Color(0xff808080),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'مانیکور دست: ',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: Color(0xff808080),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Image(
                                      image:
                                          AssetImage('assets/images/nail.png'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: .12.sw,
                left: 10,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 70.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text('حذف',
                          style: getBoldStyle16(
                            color: ColorManager.perpel,
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
