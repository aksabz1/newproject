import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    this.hintText,
    required this.textDecoration,
  });
  final String title;
  final String? hintText;
  final TextDirection textDecoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200.w,
            child: Directionality(
              textDirection: textDecoration,
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  hintTextDirection: textDecoration,
                  isDense: true,
                ),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}
