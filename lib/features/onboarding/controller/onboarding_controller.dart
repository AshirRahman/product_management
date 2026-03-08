import 'package:get/get.dart';

class OnboardingController extends GetxController {

  RxInt currentIndex = 0.obs;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (currentIndex.value == 1) {
      Get.offAllNamed('/login');
    }
  }
}