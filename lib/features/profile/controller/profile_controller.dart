import 'package:get/get.dart';

class ProfileController extends GetxController {

  String userName = "Wade Warren";

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
    Get.offAllNamed("/signin");
  }
}