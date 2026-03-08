import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/common/widgets/custom_textfield.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController controller = Get.put(SignupController());

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
                SizedBox(height: 20.h),

                /// Back Button
                GestureDetector(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: AppColors.white,
                    child: Icon(Icons.arrow_back),
                  ),
                ),

                SizedBox(height: 30.h),

                Text(
                  "Welcome to Eduline",
                  style: getTextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  "Let's join to Eduline learning ecosystem & meet our professional mentor. It's Free!",
                  style: getTextStyle(
                    color: AppColors.grey,
                  ),
                ),

                SizedBox(height: 30.h),

                /// Email
                CustomTextField(
                  label: "Email Address",
                  hintText: "pristia@gmail.com",
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 20.h),

                /// Full Name
                CustomTextField(
                  label: "Full Name",
                  hintText: "Pristia Candra",
                  controller: controller.nameController,
                ),

                SizedBox(height: 20.h),

                /// Password
                Obx(
                  () => CustomTextField(
                    label: "Password",
                    hintText: "Enter password",
                    controller: controller.passwordController,
                    isPassword: true,
                    obscureText: controller.obscurePassword.value,
                    onToggle: controller.togglePassword,
                  ),
                ),

                SizedBox(height: 10.h),

                /// Password Hint
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: AppColors.success,
                      size: 18.sp,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        "At least 8 characters with a combination of letters and numbers",
                        style: getTextStyle(
                          color: AppColors.success,
                          fontSize: 13,
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 30.h),

                /// Sign Up Button
                Obx(
                  () => CustomButton(
                    title: "Sign Up",
                    isLoading: controller.isLoading.value,
                    onTap: controller.signup,
                  ),
                ),

                SizedBox(height: 20.h),

                /// Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "Sign In",
                        style: getTextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
