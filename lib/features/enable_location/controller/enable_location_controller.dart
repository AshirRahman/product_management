import 'package:course_online/routes/app_routes.dart';
import 'package:get/get.dart';

class EnableLocationController extends GetxController {
  void enableLocation() {
    /// Future: location permission logic
    Get.offAllNamed(AppRoute.selectLanguageScreen);
  }

  void skip() {
    Get.offAllNamed(AppRoute.selectLanguageScreen);
  }
}
