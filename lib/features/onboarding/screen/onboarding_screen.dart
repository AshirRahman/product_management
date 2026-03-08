import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/app_image.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.put(OnboardingController());
  final CarouselSliderController carouselController =
      CarouselSliderController();

  final List<Map<String, String>> onboardingData = [
    {
      "image": ImagePath.onboardingo,
      "title": "Best online courses in the world",
      "subtitle":
          "Now you can learn anywhere, anytime, even if there is no internet access!"
    },
    {
      "image": ImagePath.onboard2,
      "title": "Explore your new skill today",
      "subtitle": "Our platform is designed to help you explore new skills."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Expanded(
              child: CarouselSlider.builder(
                itemCount: onboardingData.length,
                controller: carouselController,
                options: CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    controller.onPageChanged(index);
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  final item = onboardingData[index];

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppImage(path: item["image"]!, height: 260.h),
                        SizedBox(height: 40.h),
                        Text(
                          item["title"]!,
                          textAlign: TextAlign.center,
                          style: getTextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          item["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: getTextStyle(
                            fontSize: 14,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Obx(
              () => AnimatedSmoothIndicator(
                activeIndex: controller.currentIndex.value,
                count: onboardingData.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.primary,
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: Size(double.infinity, 55.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  onPressed: () {
                    if (controller.currentIndex.value == 1) {
                      controller.nextPage();
                    } else {
                      carouselController.nextPage();
                    }
                  },
                  child: Text(
                    controller.currentIndex.value == 1 ? "Get Started" : "Next",
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
