
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:salons/core/utils/color_manager.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.w,
      width: 430.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorManager.perpel,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.perpel.withOpacity(0.5),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('زهرا'),
                      Gap(10.w),
                      const Text(
                        '2024/12/04',
                        style: TextStyle(
                          color: ColorManager.grey,
                        ),
                      ),
                      const Spacer(),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        glow: false,
                        ignoreGestures: true,
                        unratedColor: ColorManager.lightGrey.withOpacity(0.6),
                        textDirection: TextDirection.ltr,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: ColorManager.perpel,
                        ),
                        itemSize: 20,
                        onRatingUpdate: (rating) {},
                      )
                    ],
                  ),
                ),
                Gap(10.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: const Row(
                    children: [
                      Text('قیمت کاشت ناخن نگین دار تون با رنگ ژله '),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

