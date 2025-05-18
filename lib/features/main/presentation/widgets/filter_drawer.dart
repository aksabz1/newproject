import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/business_management/presentation/provider/edit_info_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/widgets/eyelash_services.dart';
import 'package:salons/core/widgets/hair_services.dart';
import 'package:salons/core/widgets/nail_services.dart';
import 'package:salons/core/widgets/skin_services.dart';

class FilterDrawerWdget extends StatelessWidget {
  const FilterDrawerWdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      width: 0.9.sw,
      child: SafeArea(
        child: SingleChildScrollView(
          child: ChangeNotifierProvider<EditInfoProvider>(
            create: (context) => EditInfoProvider(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 25.w),
                  child: const Text(
                    'فیلترها',
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'ناخن',
                        style: textTheme.displayMedium,
                      ),
                      Gap(10.w),
                      Image.asset(
                        'assets/images/nail_filter.png',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0.w,
                  ),
                  child: Divider(
                    color: ColorManager.perpel.withOpacity(0.3),
                  ),
                ),
                const NailServices(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'مو',
                        style: textTheme.displayMedium,
                      ),
                      Gap(10.w),
                      Image.asset(
                        'assets/images/hair_filter.png',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0.w,
                  ),
                  child: Divider(
                    color: ColorManager.perpel.withOpacity(0.3),
                  ),
                ),
                const HairServices(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'پوست',
                        style: textTheme.displayMedium,
                      ),
                      Gap(10.w),
                      Image.asset(
                        'assets/images/skin_filter.png',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0.w,
                  ),
                  child: Divider(
                    color: ColorManager.perpel.withOpacity(0.3),
                  ),
                ),
                const SkinServices(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'مژه',
                        style: textTheme.displayMedium,
                      ),
                      Gap(10.w),
                      Image.asset(
                        'assets/images/eyelash_filter.png',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0.w,
                  ),
                  child: Divider(
                    color: ColorManager.perpel.withOpacity(0.3),
                  ),
                ),
                const EyelashServices(),
                Gap(20.w),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     ElevatedButton(
                //       onPressed: () {
                //         Navigator.pop(context);
                //       },
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: ColorManager.white,
                //         minimumSize: Size(150.w, 40.w),
                //       ),
                //       child: Text(
                //         'انصراف',
                //         style: getBoldStyle(
                //           color: ColorManager.perpel,
                //           fontSize: 20,
                //         ),
                //       ),
                //     ),
                //     Gap(10.w),
                //     ElevatedButton(
                //       onPressed: () {},
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: ColorManager.perpel,
                //         minimumSize: Size(150.w, 40.w),
                //       ),
                //       child: Text(
                //         'اعمال فیلتر',
                //         style: getBoldStyle(
                //           color: ColorManager.white,
                //           fontSize: 20,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Gap(20.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
