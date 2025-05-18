import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Align(
            alignment: Alignment.centerRight, child: Text('سوالات متداول')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 5.w),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ExpansionTileGroup(
                  spaceBetweenItem: 10,
                  toggleType: ToggleType.expandOnlyCurrent,
                  children: List.generate(
                    3,
                    (index) => _getExpansionTileItem(
                      index: index,
                      titles: [
                        'این اپلیکیشن چه خدماتی ارائه می‌دهد؟',
                        'استفاده از این اپلیکیشن برای مشتریان چه مزایایی دارد؟',
                        'آیا این اپلیکیشن رایگان است؟',
                      ],
                      contents: [
                        '''صرفه‌جویی در زمان: مشتریان می‌توانند بدون نیاز به تماس تلفنی یا مراجعه حضوری، به سرعت و به آسانی وقت رزرو کنند.
انتخاب آسان: مشتریان می‌توانند بر اساس معیارهای مختلف مانند نوع خدمات، قیمت، محل و نظرات مشتریان قبلی، آرایشگر یا سالن مورد نظر خود را انتخاب کنند.
دسترسی 24/7: این اپلیکیشن به صورت شبانه‌روزی در دسترس است، بنابراین مشتریان می‌توانند در هر زمان و مکانی که هستند وقت رزرو کنند.
پرداخت آنلاین: مشتریان می‌توانند به صورت آنلاین و امن از طریق اپلیکیشن پرداخت کنند.
مشاهده سوابق: مشتریان می‌توانند سوابق رزروهای خود را مشاهده کرده و در صورت نیاز آنها را لغو یا تغییر دهند.''',
                        '''صرفه‌جویی در زمان: مشتریان می‌توانند بدون نیاز به تماس تلفنی یا مراجعه حضوری، به سرعت و به آسانی وقت رزرو کنند.
انتخاب آسان: مشتریان می‌توانند بر اساس معیارهای مختلف مانند نوع خدمات، قیمت، محل و نظرات مشتریان قبلی، آرایشگر یا سالن مورد نظر خود را انتخاب کنند.
دسترسی 24/7: این اپلیکیشن به صورت شبانه‌روزی در دسترس است، بنابراین مشتریان می‌توانند در هر زمان و مکانی که هستند وقت رزرو کنند.
پرداخت آنلاین: مشتریان می‌توانند به صورت آنلاین و امن از طریق اپلیکیشن پرداخت کنند.
مشاهده سوابق: مشتریان می‌توانند سوابق رزروهای خود را مشاهده کرده و در صورت نیاز آنها را لغو یا تغییر دهند.''',
                        '''صرفه‌جویی در زمان: مشتریان می‌توانند بدون نیاز به تماس تلفنی یا مراجعه حضوری، به سرعت و به آسانی وقت رزرو کنند.
انتخاب آسان: مشتریان می‌توانند بر اساس معیارهای مختلف مانند نوع خدمات، قیمت، محل و نظرات مشتریان قبلی، آرایشگر یا سالن مورد نظر خود را انتخاب کنند.
دسترسی 24/7: این اپلیکیشن به صورت شبانه‌روزی در دسترس است، بنابراین مشتریان می‌توانند در هر زمان و مکانی که هستند وقت رزرو کنند.
پرداخت آنلاین: مشتریان می‌توانند به صورت آنلاین و امن از طریق اپلیکیشن پرداخت کنند.
مشاهده سوابق: مشتریان می‌توانند سوابق رزروهای خود را مشاهده کرده و در صورت نیاز آنها را لغو یا تغییر دهند.''',
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ExpansionTileItem _getExpansionTileItem(
      {required int index,
      required List<String> titles,
      required List<String> contents}) {
    return ExpansionTileOutlined(
      title: Text(
        '${index + 1}. ${titles[index]}',
        textDirection: TextDirection.rtl,
        style: getBoldStyle(color: ColorManager.black, fontSize: 15),
      ),
      expendedBorderColor: ColorManager.perpel,
      children: [
        Text(
          'این اپلیکیشن به مشتریان امکان می‌دهد تا به راحتی از میان آرایشگرها و سالن‌های مختلف در منطقه خود جستجو کرده، وقت رزرو کنند و به صورت آنلاین پرداخت کنند.',
          textDirection: TextDirection.rtl,
          style: getLightStyle(
            color: ColorManager.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
