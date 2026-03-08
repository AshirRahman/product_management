import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/common/widgets/custom_textfield.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final ResetPasswordController controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// Back
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "Reset Password",
                style: getTextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Your password must be at least 8 characters long and include a combination of letters, numbers",
                textAlign: TextAlign.center,
                style: getTextStyle(color: AppColors.grey),
              ),

              const SizedBox(height: 40),

              /// New Password
              Obx(
                () => CustomTextField(
                  label: "New Password",
                  hintText: "Enter password",
                  controller: controller.passwordController,
                  isPassword: true,
                  obscureText: controller.obscurePassword.value,
                  onToggle: controller.togglePassword,
                ),
              ),

              const SizedBox(height: 20),

              /// Confirm Password
              Obx(
                () => CustomTextField(
                  label: "Confirm New Password",
                  hintText: "Confirm password",
                  controller: controller.confirmPasswordController,
                  isPassword: true,
                  obscureText: controller.obscureConfirmPassword.value,
                  onToggle: controller.toggleConfirmPassword,
                ),
              ),

              const SizedBox(height: 40),

              /// Submit Button
              Obx(
                () => CustomButton(
                  title: "Submit",
                  isLoading: controller.isLoading.value,
                  onTap: controller.submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
