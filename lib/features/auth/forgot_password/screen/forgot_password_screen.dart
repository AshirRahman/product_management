import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/common/widgets/custom_textfield.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              /// Back Button
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back),
              ),

              const SizedBox(height: 30),

              Center(
                child: Text(
                  "Forgot Password",
                  style: getTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: Text(
                  "Enter your email, we will send a\nverification code to email",
                  textAlign: TextAlign.center,
                  style: getTextStyle(color: AppColors.grey),
                ),
              ),

              const SizedBox(height: 40),

              /// Email Field
              CustomTextField(
                label: "Email Address",
                hintText: "pristia@gmail.com",
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 30),

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
