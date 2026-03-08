import 'package:course_online/core/common/widgets/app_image.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductHeader extends StatelessWidget {
  final String image;

  const ProductHeader({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        color: AppColors.grey200,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: AppImage(
          path: image,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    );
  }
}
