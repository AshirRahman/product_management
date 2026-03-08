import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/app_image.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/common/widgets/custom_textfield.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),

                const AppImage(
                  path: ImagePath.bulb,
                  height: 100,
                ),

                const SizedBox(height: 20),

                Text(
                  "Welcome Back!",
                  style: getTextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Please login first to start your Theory Test.",
                  style: getTextStyle(
                    color: AppColors.grey,
                  ),
                ),

                const SizedBox(height: 40),

                /// Email
                CustomTextField(
                  label: "Email Address",
                  hintText: "pristia@gmail.com",
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

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

                const SizedBox(height: 15),

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

                const SizedBox(height: 25),

                /// Sign In Button
                Obx(
                  () => CustomButton(
                    title: "Sign In",
                    isLoading: controller.isLoading.value,
                    onTap: controller.login,
                  ),
                ),

                const SizedBox(height: 20),

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
