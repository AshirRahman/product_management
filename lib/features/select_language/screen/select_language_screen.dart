import 'package:course_online/core/common/widgets/app_image.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/select_language_controller.dart';

class SelectLanguageScreen extends StatelessWidget {
  SelectLanguageScreen({super.key});

  final SelectLanguageController controller =
      Get.put(SelectLanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// Back
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back),
              ),

              const SizedBox(height: 10),

              const Text(
                "What is Your Mother Language",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Discover what is a podcast description and podcast summary.",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 25),

              /// Language List
              Expanded(
                child: Obx(
                  () {
                    final selectedIdx = controller.selectedIndex.value;
                    return ListView.builder(
                      itemCount: controller.languages.length,
                      itemBuilder: (context, index) {
                        final language = controller.languages[index];
                        final selected = selectedIdx == index;

                        return GestureDetector(
                          onTap: () => controller.selectLanguage(index),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            decoration: BoxDecoration(
                              color: selected
                                  ? Colors.white
                                  : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                AppImage(
                                  path: language["flag"]!,
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  language["name"]!,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Spacer(),
                                selected
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: const Color(0xff2D6CDF),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Row(
                                          children: [
                                            Icon(Icons.check,
                                                color: Colors.white, size: 16),
                                            SizedBox(width: 5),
                                            Text(
                                              "Selected",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Text("Select"),
                                      )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              /// Continue Button
              CustomButton(
                title: "Continue",
                onTap: controller.continueNext,
              ),

              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
