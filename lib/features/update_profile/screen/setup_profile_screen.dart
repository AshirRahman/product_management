import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/common/widgets/custom_textfield.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/setup_profile_controller.dart';

class SetupProfileScreen extends StatelessWidget {
  SetupProfileScreen({super.key});

  final SetupProfileController controller = Get.put(SetupProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),

                /// AppBar row — back button + title
                Row(
                  children: [
                    if (!controller.fromVerify)
                      IconButton(
                        onPressed: () => Get.offNamed(AppRoute.profileScreen),
                        icon: const Icon(Icons.arrow_back),
                      )
                    else
                      SizedBox(width: 48.w),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Set Up Profile",
                          style: getTextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 48.w),
                  ],
                ),

                SizedBox(height: 20.h),

                /// Profile Image
                Center(
                  child: Obx(
                    () => GestureDetector(
                      onTap: controller.pickImage,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 45.r,
                            backgroundColor: AppColors.grey300,
                            backgroundImage:
                                controller.profileImage.value != null
                                    ? FileImage(controller.profileImage.value!)
                                    : null,
                            child: controller.profileImage.value == null
                                ? const Icon(
                                    Icons.person,
                                    size: 40,
                                    color: AppColors.white,
                                  )
                                : null,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Upload profile picture",
                            style: getTextStyle(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                /// Full Name
                CustomTextField(
                  label: "Full Name",
                  hintText: "Enter your full name",
                  controller: controller.fullNameController,
                ),

                SizedBox(height: 20.h),

                /// Country
                CustomTextField(
                  label: "Country",
                  hintText: "Enter your country",
                  controller: controller.countryController,
                ),

                SizedBox(height: 30.h),

                /// Submit Button
                Obx(
                  () => CustomButton(
                    title: controller.isLoading.value ? "Saving..." : "Save",
                    onTap: controller.isLoading.value ? () {} : controller.next,
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
