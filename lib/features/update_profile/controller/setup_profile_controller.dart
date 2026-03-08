import 'dart:io';
import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/features/home/controller/home_controller.dart';
import 'package:course_online/features/profile/controller/profile_controller.dart';
import 'package:course_online/features/update_profile/services/setup_profile_services.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SetupProfileController extends GetxController {
  final fullNameController = TextEditingController();
  final countryController = TextEditingController();

  Rx<File?> profileImage = Rx<File?>(null);
  RxBool isLoading = false.obs;

  /// true হলে verify code screen থেকে এসেছে
  bool fromVerify = false;

  final picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    fromVerify = Get.arguments == true;
  }

  /// Pick Image
  Future<void> pickImage() async {
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (picked != null) {
      profileImage.value = File(picked.path);
    }
  }

  /// Submit Profile
  Future<void> next() async {
    if (fullNameController.text.trim().isEmpty ||
        countryController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please fill in all required fields");
      return;
    }

    isLoading.value = true;

    ResponseData response = await SetupProfileService.updateProfile(
      fullName: fullNameController.text.trim(),
      country: countryController.text.trim(),
      imagePath: profileImage.value?.path,
    );

    isLoading.value = false;

    if (response.isSuccess) {
      Get.snackbar("Success", "Profile updated successfully");
      if (fromVerify) {
        Get.offAllNamed(AppRoute.homeScreen);
      } else {
        if (Get.isRegistered<HomeController>()) {
          Get.find<HomeController>().fetchProfile();
        }
        Get.delete<ProfileController>(force: true);
        Get.offNamed(AppRoute.profileScreen);
      }
    } else {
      Get.snackbar("Error", response.errorMessage);
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    countryController.dispose();
    super.onClose();
  }
}
