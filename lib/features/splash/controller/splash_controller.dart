import 'package:course_online/core/services/storage_service.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    if (StorageService.hasToken()) {
      Get.offAllNamed(AppRoute.homeScreen);
    } else {
      Get.offAllNamed(AppRoute.onboardingScreen);
    }
  }
}
