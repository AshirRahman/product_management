import 'dart:io';
import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadPhotoWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String? imagePath;

  const UploadPhotoWidget({
    super.key,
    required this.onTap,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.grey300,
            style: BorderStyle.solid,
          ),
        ),
        child: imagePath != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.file(
                  File(imagePath!),
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            : Column(
                children: [
                  Icon(
                    Icons.add_a_photo_outlined,
                    size: 40.sp,
                    color: AppColors.grey,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Upload photo",
                    style: getTextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Upload file size is less than 5MB\nSupport: JPG, PNG",
                    textAlign: TextAlign.center,
                    style: getTextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Choose a file",
                    style: getTextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
