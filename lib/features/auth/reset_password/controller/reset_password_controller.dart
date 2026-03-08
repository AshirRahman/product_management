import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool obscurePassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;
  RxBool isLoading = false.obs;

  RxString passwordError = ''.obs;
  RxString confirmPasswordError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    passwordController.addListener(() {
      if (passwordError.isNotEmpty) passwordError.value = '';
    });
    confirmPasswordController.addListener(() {
      if (confirmPasswordError.isNotEmpty) confirmPasswordError.value = '';
    });
  }

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPassword() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  bool _validate() {
    bool valid = true;
    final password = passwordController.text;
    final confirm = confirmPasswordController.text;

    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      valid = false;
    } else if (password.length < 8) {
      passwordError.value = 'Password must be at least 8 characters';
      valid = false;
    }

    if (confirm.isEmpty) {
      confirmPasswordError.value = 'Please confirm your password';
      valid = false;
    } else if (password.isNotEmpty && confirm != password) {
      confirmPasswordError.value = 'Passwords do not match';
      valid = false;
    }

    return valid;
  }

  void submit() async {
    if (!_validate()) return;

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    Get.offAllNamed("/signin");
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
