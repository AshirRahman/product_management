import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/enable_location_controller.dart';

class EnableLocationScreen extends StatelessWidget {
  EnableLocationScreen({super.key});

  final EnableLocationController controller =
      Get.put(EnableLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0xff2D6CDF).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.location_on,
                  size: 80,
                  color: Color(0xff2D6CDF),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Enable Location",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Kindly allow us to access your location to provide you with suggestions for nearby salons",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40),

              /// Enable Button
              CustomButton(
                title: "Enable",
                onTap: controller.enableLocation,
              ),

              const SizedBox(height: 20),

              /// Skip
              GestureDetector(
                onTap: controller.skip,
                child: const Text(
                  "Skip, Not Now",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
