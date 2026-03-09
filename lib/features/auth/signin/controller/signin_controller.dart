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

  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      if (emailError.isNotEmpty) emailError.value = '';
    });
    passwordController.addListener(() {
      if (passwordError.isNotEmpty) passwordError.value = '';
    });
  }

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleRemember() {
    rememberMe.value = !rememberMe.value;
  }

  bool _validate() {
    bool valid = true;
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty) {
      emailError.value = 'Email is required';
      valid = false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Enter a valid email address';
      valid = false;
    }

    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      valid = false;
    } else if (password.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      valid = false;
    }

    return valid;
  }

  Future<void> login() async {
    if (!_validate()) return;

    isLoading.value = true;

    ResponseData response = await SigninServices.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    isLoading.value = false;

    if (response.isSuccess) {
      String token = response.responseData['data']['token'];
      await StorageService.saveToken(token, emailController.text.trim());

      Get.offAllNamed(AppRoute.homeScreen);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
