import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onTap;
  final VoidCallback? onClose;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onTap,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Close Button
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: onClose ?? () => Navigator.pop(context),
                child: const Icon(Icons.close),
              ),
            ),

            const SizedBox(height: 10),

            /// Icon
            Container(
              height: 90.h,
              width: 90.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.dialogIconBg,
              ),
              child: Icon(
                Icons.check,
                size: 45.sp,
                color: AppColors.primary,
              ),
            ),

            SizedBox(height: 20.h),

            /// Title
            Text(
              title,
              style: getTextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10.h),

            /// Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: getTextStyle(
                color: AppColors.grey,
              ),
            ),

            SizedBox(height: 25.h),

            /// Button
            CustomButton(
              title: buttonText,
              onTap: onTap,
            )
          ],
        ),
      ),
    );
  }
}
