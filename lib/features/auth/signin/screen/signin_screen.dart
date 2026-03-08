import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/app_image.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/common/widgets/custom_textfield.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/signin_controller.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final SigninController controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.h),

                AppImage(
                  path: ImagePath.bulb,
                  height: 100.h,
                ),

                SizedBox(height: 20.h),

                Text(
                  "Welcome Back!",
                  style: getTextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  "Please login first to start your Theory Test.",
                  style: getTextStyle(
                    color: AppColors.grey,
                  ),
                ),

                SizedBox(height: 40.h),

                /// Email
                Obx(
                  () => CustomTextField(
                    label: "Email Address",
                    hintText: "pristia@gmail.com",
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    errorText: controller.emailError.value.isEmpty
                        ? null
                        : controller.emailError.value,
                  ),
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
                    errorText: controller.passwordError.value.isEmpty
                        ? null
                        : controller.passwordError.value,
                  ),
                ),

                SizedBox(height: 15.h),

                /// Remember + Forgot
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        activeColor: AppColors.primary,
                        value: controller.rememberMe.value,
                        onChanged: (v) => controller.toggleRemember(),
                      ),
                    ),
                    const Text("Remember Me"),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.toNamed("/forgot-password");
                      },
                      child: Text(
                        "Forgot Password",
                        style: getTextStyle(color: AppColors.lightGreyText),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 25.h),

                /// Sign In Button
                Obx(
                  () => CustomButton(
                    title: "Sign In",
                    isLoading: controller.isLoading.value,
                    onTap: controller.login,
                  ),
                ),

                SizedBox(height: 20.h),

                /// Create Account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("New to Theory Test? "),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/signup");
                      },
                      child: Text(
                        "Create Account",
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
