import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoTag extends StatelessWidget {
  final String title;

  const ProductInfoTag({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.tagPurple,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        title,
        style: getTextStyle(
          color: AppColors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
