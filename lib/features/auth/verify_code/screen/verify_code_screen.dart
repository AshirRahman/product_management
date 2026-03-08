import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../controller/verify_code_controller.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});

  final VerifyCodeController controller = Get.put(VerifyCodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// Back
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                "Verify Code",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Please enter the code we just sent to\nemail pristia@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 40),

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
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 55,
                  fieldWidth: 55,
                  activeColor: const Color(0xff2D6CDF),
                  selectedColor: const Color(0xff2D6CDF),
                  inactiveColor: Colors.grey.shade300,
                ),
              ),

              const SizedBox(height: 40),

              /// Verify Button (CustomButton)
              Obx(
                () => CustomButton(
                  title: "Verify",
                  isLoading: controller.isLoading.value,
                  onTap: controller.verify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
