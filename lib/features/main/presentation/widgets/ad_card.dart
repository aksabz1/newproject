import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';

class AdCard extends StatelessWidget {
  const AdCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
      child: GestureDetector(
        onTap: () {
          if (index.isEven) {
            Navigator.pushNamed(context, '/salonRoute');
          } else {
            Navigator.pushNamed(context, '/beauticianAd');
          }
        },
        child: Container(
          height: .35.sh,
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
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
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
                                image: AssetImage('assets/images/nail.png'),
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
                                image: AssetImage('assets/images/nail.png'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: Row(
                        children: [
                          Text(
                            'بیشتر...',
                            textDirection: TextDirection.rtl,
                            style: getBoldStyle(
                              color: ColorManager.perpel,
                            ),
                          ),
                        ],
                      ),
                    )
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
