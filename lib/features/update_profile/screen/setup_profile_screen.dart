import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/common/widgets/custom_textfield.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                /// AppBar row — back button + title
                Row(
                  children: [
                    if (!controller.fromVerify)
                      IconButton(
                        onPressed: () => Get.offNamed(AppRoute.profileScreen),
                        icon: const Icon(Icons.arrow_back),
                      )
                    else
                      const SizedBox(width: 48),
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
                    const SizedBox(width: 48),
                  ],
                ),

                const SizedBox(height: 20),

                /// Profile Image
                Center(
                  child: Obx(
                    () => GestureDetector(
                      onTap: controller.pickImage,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 45,
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
                          const SizedBox(height: 8),
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

                const SizedBox(height: 30),

                /// Full Name
                CustomTextField(
                  label: "Full Name",
                  hintText: "Enter your full name",
                  controller: controller.fullNameController,
                ),

                const SizedBox(height: 20),

                /// Country
                CustomTextField(
                  label: "Country",
                  hintText: "Enter your country",
                  controller: controller.countryController,
                ),

                const SizedBox(height: 30),

                /// Submit Button
                Obx(
                  () => CustomButton(
                    title: controller.isLoading.value ? "Saving..." : "Save",
                    onTap: controller.isLoading.value ? () {} : controller.next,
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
