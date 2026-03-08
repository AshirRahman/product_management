import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onToggle;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggle,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null && errorText!.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: onToggle,
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(
                color: hasError ? AppColors.error : AppColors.inputBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(
                color: hasError ? AppColors.error : AppColors.primary,
              ),
            ),
          ),
        ),
        if (hasError) ...[
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              errorText!,
              style: getTextStyle(
                fontSize: 12,
                color: AppColors.error,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
