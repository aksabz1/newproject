import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';

class ShowSalonServices extends StatelessWidget {
  final String beauticianName;
  final String serviceName;
  const ShowSalonServices({
    super.key,
    required this.beauticianName,
    required this.serviceName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              serviceName,
              style: getBoldStyle16(
                color: ColorManager.perpel,
              ),
            ),
            Text(
              beauticianName,
              style: getBoldStyle14(
                color: ColorManager.grey,
              ),
            )
          ],
        ),
        Gap(10.w),
        Wrap(
          spacing: 10.w,
          runSpacing: 10.w,
          children: const [
            ShowProvidedService(serviceName: 'هایلایت'),
            ShowProvidedService(serviceName: 'کوتاهی'),
            ShowProvidedService(serviceName: 'هایلایت'),
            ShowProvidedService(serviceName: 'کوتاهی'),
            ShowProvidedService(serviceName: 'اصلاح'),
          ],
        ),
        Gap(20.w),
        Row(
          children: [
            Text(
              ':عکس‌های نمونه کار',
              textDirection: TextDirection.ltr,
              style: getBoldStyle(color: ColorManager.grey),
            ),
          ],
        ),
        Gap(10.w),
        SizedBox(
          height: .1.sh,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            reverse: true,
            itemCount: 4,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => Dialog(
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/arayes1.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ));
                },
                child: Container(
                  height: .2.sw,
                  width: .2.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorManager.perpel,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/arayes1.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Gap(20.w),
      ],
    );
  }
}

class ShowProvidedService extends StatelessWidget {
  const ShowProvidedService({
    super.key,
    required this.serviceName,
  });
  final String serviceName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.w,
      width: 120.w,
      decoration: BoxDecoration(
        color: ColorManager.perpel,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          serviceName,
          style: getBoldStyle16(color: Colors.white),
        ),
      ),
    );
  }
}
