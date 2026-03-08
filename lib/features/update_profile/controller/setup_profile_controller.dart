import 'dart:io';
import 'package:course_online/core/services/storage_service.dart';
import 'package:course_online/features/update_profile/services/setup_profile_services.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SetupProfileController extends GetxController {
  final aboutController = TextEditingController();
  final dobController = TextEditingController();

  RxString selectedGender = "".obs;
  Rx<File?> profileImage = Rx<File?>(null);

  RxBool isLoading = false.obs;

  final picker = ImagePicker();

  final genders = ["Male", "Female", "Other"];

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  /// Pick Image
  Future<void> pickImage() async {
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (picked != null) {
      profileImage.value = File(picked.path);
    }
  }

  /// Date
  void onDateSelected(DateRangePickerSelectionChangedArgs args) {
    DateTime date = args.value;

    dobController.text = "${date.day}/${date.month}/${date.year}";
  }

  /// Submit Profile
  Future<void> next() async {
    if (profileImage.value == null) {
      Get.snackbar("Error", "Please upload profile image");
      return;
    }

    isLoading.value = true;

    bool success = await SetupProfileService.completeProfile(
      token: StorageService.token ?? "",
      about: aboutController.text,
      dob: dobController.text,
      gender: selectedGender.value,
      imagePath: profileImage.value!.path,
    );

    isLoading.value = false;

    if (success) {
      Get.offAllNamed(AppRoute.homeScreen);
    } else {
      Get.snackbar("Error", "Profile update failed");
    }
  }
}
