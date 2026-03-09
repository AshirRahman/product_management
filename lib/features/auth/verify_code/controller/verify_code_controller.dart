import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/core/services/storage_service.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:get/get.dart';
import '../services/verify_code_services.dart';

class VerifyCodeController extends GetxController {
  RxString otpCode = "".obs;
  RxBool isLoading = false.obs;
  RxBool isResendLoading = false.obs;

  String email = Get.arguments ?? "";

  void onCompleted(String value) {
    otpCode.value = value;
  }

  Future<void> verify() async {
    if (otpCode.value.length != 4) return;

    isLoading.value = true;

    ResponseData response = await VerifyCodeServices.verifyOtp(
      email: email,
      otp: otpCode.value,
    );

    isLoading.value = false;

    if (response.isSuccess) {
      String token = response.responseData['data']['token'];
      await StorageService.saveToken(token, email);

      Get.offAllNamed(AppRoute.enableLocationScreen);
    }
  }

  Future<void> resendOtp() async {
    isResendLoading.value = true;
    await VerifyCodeServices.resendOtp(email: email);
    isResendLoading.value = false;
  }
}
