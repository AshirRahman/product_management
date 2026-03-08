import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/core/services/storage_service.dart';
import 'package:course_online/features/profile/model/profile_model.dart';
import 'package:course_online/features/profile/services/profile_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<ProfileModel?> profile = Rx<ProfileModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    isLoading.value = true;

    ResponseData response = await ProfileService.getProfile();

    isLoading.value = false;

    if (response.isSuccess) {
      profile.value = ProfileModel.fromJson(response.responseData['data']);
    } else {
      Get.snackbar("Error", response.errorMessage);
    }
  }

  void editProfile() {
    Get.toNamed("/setup-profile");
  }

  void support() {
    Get.toNamed("/support");
  }

  void privacy() {
    Get.toNamed("/privacy");
  }

  void logout() {
    StorageService.logoutUser();
    Get.offAllNamed("/signin");
  }
}
