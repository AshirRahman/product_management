import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/app_image.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(
                path: ImagePath.map,
                height: 220,
              ),

              const SizedBox(height: 30),

              Text(
                "Enable Location",
                style: getTextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Kindly allow us to access your location to provide you with suggestions for nearby salons",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  color: AppColors.grey,
                ),
              ),

              const SizedBox(height: 40),

              /// Enable Button
              CustomButton(
                title: "Enable",
                onTap: controller.enableLocation,
              ),

              const SizedBox(height: 20),

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
