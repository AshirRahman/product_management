import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/signup_services.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool obscurePassword = true.obs;
  RxBool isLoading = false.obs;

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> signup() async {
    if (emailController.text.isEmpty ||
        nameController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    isLoading.value = true;

    ResponseData response = await SignupServices.signup(
      fullName: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    isLoading.value = false;

    if (response.isSuccess) {
      Get.snackbar("Success", response.responseData['message']);
      Get.toNamed(
        AppRoute.verifyCodeScreen,
        arguments: emailController.text.trim(),
      );
    } else {
      Get.snackbar("Error", response.errorMessage);
    }
  }
}
