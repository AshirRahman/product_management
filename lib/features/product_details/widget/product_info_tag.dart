import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductInfoTag extends StatelessWidget {
  final String title;

  const ProductInfoTag({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.tagPurple,
        borderRadius: BorderRadius.circular(20),
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
