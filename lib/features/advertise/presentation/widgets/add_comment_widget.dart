
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';

class AddCommentWidget extends StatelessWidget {
  const AddCommentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.w,
      width: 430.w,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.perpel),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.w),
            child: Row(
              children: [
                Text(
                  'امتیاز دهید',
                  style: getBoldStyle14(
                    color: ColorManager.grey,
                  ),
                ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  glow: false,
                  unratedColor: ColorManager.lightGrey.withOpacity(0.6),
                  textDirection: TextDirection.ltr,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: ColorManager.perpel,
                  ),
                  itemSize: 30,
                  onRatingUpdate: (rating) {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 100.w,
            width: 380.w,
            child: TextField(
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'نظر خود را بنویسید',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: ColorManager.perpel,
                  ),
                ),
              ),
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
            ),
          ),
          Gap(10.w),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 30.w,
                  width: 150.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'ارسال نظر',
                      style: getBoldStyle14(
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
