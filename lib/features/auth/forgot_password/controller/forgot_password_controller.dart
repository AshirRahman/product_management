import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {

  final emailController = TextEditingController();

  RxBool isLoading = false.obs;

  void sendCode() async {

    if (emailController.text.isEmpty) {
      Get.snackbar("Error", "Enter your email");
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    Get.toNamed("/verify-code");

  }

}