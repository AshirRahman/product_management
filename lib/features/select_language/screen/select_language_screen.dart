import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/app_image.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/utils/constants/colors.dart';
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
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              Center(
                child: Text(
                  "What is Your Mother Language",
                  style: getTextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Center(
                child: Text(
                  "Discover what is a podcast description and podcast summary.",
                  style: getTextStyle(
                    color: AppColors.grey,
                  ),
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
                                  ? AppColors.white
                                  : AppColors.grey100,
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
                                  style: getTextStyle(fontSize: 16),
                                ),
                                const Spacer(),
                                selected
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.check,
                                                color: AppColors.white,
                                                size: 16),
                                            const SizedBox(width: 5),
                                            Text(
                                              "Selected",
                                              style: getTextStyle(
                                                  color: AppColors.white),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: AppColors.grey300,
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
