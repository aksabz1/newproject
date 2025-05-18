import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salons/core/utils/color_manager.dart';

class ProfileBookmarkedCard extends StatelessWidget {
  const ProfileBookmarkedCard({super.key});

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
          child: Container(
            height: .25.sh,
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
                  flex: 2,
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
