import 'package:course_online/routes/app_routes.dart';
import 'package:get/get.dart';

class SelectLanguageController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final languages = [
    {"name": "English (US)", "flag": "assets/flags/us.png"},
    {"name": "Indonesia", "flag": "assets/flags/id.png"},
    {"name": "Afghanistan", "flag": "assets/flags/af.png"},
    {"name": "Algeria", "flag": "assets/flags/dz.png"},
    {"name": "Malaysia", "flag": "assets/flags/my.png"},
    {"name": "Arabic", "flag": "assets/flags/ae.png"},
  ];

  void selectLanguage(int index) {
    selectedIndex.value = index;
  }

  void continueNext() {
    Get.toNamed(AppRoute.setupProfileScreen);
  }
}
