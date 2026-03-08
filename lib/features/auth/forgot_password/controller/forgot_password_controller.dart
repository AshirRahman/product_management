import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  RxBool isLoading = false.obs;
  RxString emailError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      if (emailError.isNotEmpty) emailError.value = '';
    });
  }

  bool _validate() {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      emailError.value = 'Email is required';
      return false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Enter a valid email address';
      return false;
    }
    return true;
  }

  void sendCode() async {
    if (!_validate()) return;

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    Get.toNamed("/verify-code");
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
