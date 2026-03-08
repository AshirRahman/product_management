import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/app_image.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),

              Center(
                child: Text(
                  "What is Your Mother Language",
                  style: getTextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 8.h),

              Center(
                child: Text(
                  "Discover what is a podcast description and podcast summary.",
                  style: getTextStyle(
                    color: AppColors.grey,
                  ),
                ),
              ),

              SizedBox(height: 25.h),

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
                            margin: EdgeInsets.only(bottom: 12.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 12.h),
                            decoration: BoxDecoration(
                              color: selected
                                  ? AppColors.white
                                  : AppColors.grey100,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              children: [
                                AppImage(
                                  path: language["flag"]!,
                                  height: 30.h,
                                  width: 30.w,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  language["name"]!,
                                  style: getTextStyle(fontSize: 16),
                                ),
                                const Spacer(),
                                selected
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 6.h),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.check,
                                                color: AppColors.white,
                                                size: 16.sp),
                                            SizedBox(width: 5.w),
                                            Text(
                                              "Selected",
                                              style: getTextStyle(
                                                  color: AppColors.white),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 6.h),
                                        decoration: BoxDecoration(
                                          color: AppColors.grey300,
                                          borderRadius:
                                              BorderRadius.circular(20.r),
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

              SizedBox(height: 10.h),

              /// Continue Button
              CustomButton(
                title: "Continue",
                onTap: controller.continueNext,
              ),

              SizedBox(height: 20.h)
            ],
          ),
        ),
      ),
    );
  }
}
