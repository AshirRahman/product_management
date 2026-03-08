import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/core/services/storage_service.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/signin_services.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool obscurePassword = true.obs;
  RxBool rememberMe = false.obs;
  RxBool isLoading = false.obs;

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleRemember() {
    rememberMe.value = !rememberMe.value;
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Email and password required");
      return;
    }

    isLoading.value = true;

    ResponseData response = await SigninServices.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    isLoading.value = false;

    if (response.isSuccess) {
      String token = response.responseData['data']['token'];
      await StorageService.saveToken(token, emailController.text.trim());

      Get.snackbar("Success", response.responseData['message']);

      Get.offAllNamed(AppRoute.homeScreen);
    } else {
      Get.snackbar("Error", response.errorMessage);
    }
  }
}
