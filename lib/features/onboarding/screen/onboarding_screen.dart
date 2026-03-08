import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:course_online/core/common/widgets/app_image.dart';
import 'package:flutter/material.dart';
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
      "image": "assets/images/onboard1.png",
      "title": "Best online courses in the world",
      "subtitle":
          "Now you can learn anywhere, anytime, even if there is no internet access!"
    },
    {
      "image": "assets/images/onboard2.png",
      "title": "Explore your new skill today",
      "subtitle": "Our platform is designed to help you explore new skills."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppImage(path: item["image"]!, height: 260),
                        const SizedBox(height: 40),
                        Text(
                          item["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          item["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
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
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xff2D6CDF),
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D6CDF),
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
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
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
