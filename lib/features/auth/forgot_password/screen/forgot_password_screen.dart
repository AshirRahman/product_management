import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/common/widgets/custom_textfield.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              /// Back Button
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back),
              ),

              SizedBox(height: 30.h),

              Center(
                child: Text(
                  "Forgot Password",
                  style: getTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 10.h),

              Center(
                child: Text(
                  "Enter your email, we will send a\nverification code to email",
                  textAlign: TextAlign.center,
                  style: getTextStyle(color: AppColors.grey),
                ),
              ),

              SizedBox(height: 40.h),

              /// Email Field
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

              SizedBox(height: 30.h),

              /// Continue Button
              Obx(
                () => CustomButton(
                  title: "Continue",
                  isLoading: controller.isLoading.value,
                  onTap: controller.sendCode,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
