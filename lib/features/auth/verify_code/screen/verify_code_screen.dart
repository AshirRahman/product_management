import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../controller/verify_code_controller.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});

  final VerifyCodeController controller = Get.put(VerifyCodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),

              /// Back
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),

              SizedBox(height: 40.h),

              Text(
                "Verify Code",
                style: getTextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10.h),

              Text(
                "Please enter the code we just sent to\nemail pristia@gmail.com",
                textAlign: TextAlign.center,
                style: getTextStyle(color: AppColors.grey),
              ),

              SizedBox(height: 40.h),

              /// OTP Field
              PinCodeTextField(
                appContext: context,
                length: 4,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                onCompleted: controller.onCompleted,
                onChanged: (value) {},
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12.r),
                  fieldHeight: 55.h,
                  fieldWidth: 55.w,
                  activeColor: AppColors.primary,
                  selectedColor: AppColors.primary,
                  inactiveColor: AppColors.grey300,
                ),
              ),

              SizedBox(height: 40.h),

              /// Verify Button (CustomButton)
              Obx(
                () => CustomButton(
                  title: "Verify",
                  isLoading: controller.isLoading.value,
                  onTap: controller.verify,
                ),
              ),

              SizedBox(height: 20.h),

              /// Resend OTP
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the code? ",
                      style: getTextStyle(color: AppColors.grey),
                    ),
                    GestureDetector(
                      onTap: controller.isResendLoading.value
                          ? null
                          : controller.resendOtp,
                      child: controller.isResendLoading.value
                          ? SizedBox(
                              width: 16.w,
                              height: 16.h,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(
                              "Resend",
                              style: getTextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
