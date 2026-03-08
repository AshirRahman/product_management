import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/app_image.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/enable_location_controller.dart';

class EnableLocationScreen extends StatelessWidget {
  EnableLocationScreen({super.key});

  final EnableLocationController controller =
      Get.put(EnableLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(
                path: ImagePath.map,
                height: 220.h,
              ),

              SizedBox(height: 30.h),

              Text(
                "Enable Location",
                style: getTextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10.h),

              Text(
                "Kindly allow us to access your location to provide you with suggestions for nearby salons",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  color: AppColors.grey,
                ),
              ),

              SizedBox(height: 40.h),

              /// Enable Button
              CustomButton(
                title: "Enable",
                onTap: controller.enableLocation,
              ),

              SizedBox(height: 20.h),

              /// Skip
              GestureDetector(
                onTap: controller.skip,
                child: Text(
                  "Skip, Not Now",
                  style: getTextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
