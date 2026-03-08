import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 20),

                /// Back Button
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Welcome to Eduline",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Let’s join to Eduline learning ecosystem & meet our professional mentor. It’s Free!",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                /// Email
                CustomTextField(
                  label: "Email Address",
                  hintText: "pristia@gmail.com",
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                /// Full Name
                CustomTextField(
                  label: "Full Name",
                  hintText: "Pristia Candra",
                  controller: controller.nameController,
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

                const SizedBox(height: 10),

                /// Password Hint
                const Row(
                  children: [

                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 18,
                    ),

                    SizedBox(width: 8),

                    Expanded(
                      child: Text(
                        "At least 8 characters with a combination of letters and numbers",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 13,
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 30),

                /// Sign Up Button
                Obx(
                  () => CustomButton(
                    title: "Sign Up",
                    isLoading: controller.isLoading.value,
                    onTap: controller.signup,
                  ),
                ),

                const SizedBox(height: 20),

                /// Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text("Already have an account? "),

                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xff2D6CDF),
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