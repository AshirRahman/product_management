import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/app_image.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Spacer(),
              Column(
                children: [
                  AppImage(
                    path: ImagePath.splash,
                    height: 120.h,
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    "Theory test in my language",
                    style: getTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "I must write the real test will be in English language and this app just helps you to understand the materials in your language",
                    textAlign: TextAlign.center,
                    style: getTextStyle(
                      color: AppColors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Spacer(),
              SpinKitFadingCircle(
                color: AppColors.accentBlue,
                size: 50.sp,
              ),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }
}
