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

  RxString emailError = ''.obs;
  RxString nameError = ''.obs;
  RxString passwordError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      if (emailError.isNotEmpty) emailError.value = '';
    });
    nameController.addListener(() {
      if (nameError.isNotEmpty) nameError.value = '';
    });
    passwordController.addListener(() {
      if (passwordError.isNotEmpty) passwordError.value = '';
    });
  }

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  bool _validate() {
    bool valid = true;
    final email = emailController.text.trim();
    final name = nameController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty) {
      emailError.value = 'Email is required';
      valid = false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Enter a valid email address';
      valid = false;
    }

    if (name.isEmpty) {
      nameError.value = 'Full name is required';
      valid = false;
    }

    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      valid = false;
    } else if (password.length < 8) {
      passwordError.value = 'Password must be at least 8 characters';
      valid = false;
    } else if (!RegExp(r'(?=.*[a-zA-Z])(?=.*[0-9])').hasMatch(password)) {
      passwordError.value = 'Include both letters and numbers';
      valid = false;
    }

    return valid;
  }

  Future<void> signup() async {
    if (!_validate()) return;

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

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
