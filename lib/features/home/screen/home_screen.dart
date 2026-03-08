import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../widget/product_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            /// Header
            Obx(
              () => Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoute.profileScreen),
                      child: ClipOval(
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: (controller.profile.value?.profileImage !=
                                      null &&
                                  controller
                                      .profile.value!.profileImage!.isNotEmpty)
                              ? Image.network(
                                  controller.profile.value!.profileImage!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    color: AppColors.grey300,
                                    child: const Icon(Icons.person,
                                        color: AppColors.white, size: 24),
                                  ),
                                  loadingBuilder: (_, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(color: AppColors.grey300);
                                  },
                                )
                              : Container(
                                  color: AppColors.grey400,
                                  child: const Icon(Icons.person,
                                      color: AppColors.white, size: 24),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, ${controller.profile.value?.fullName ?? '...'}!",
                          style: getTextStyle(color: AppColors.white),
                        ),
                        Text(
                          controller.profile.value?.country ?? '',
                          style: getTextStyle(color: AppColors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Services",
                  style: getTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// Product Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: .7,
                          ),
                          itemCount: controller.products.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              product: controller.products[index],
                            );
                          },
                        ),
                ),
              ),
            ),

            /// Create Product
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(
                title: "Create Product",
                onTap: () {
                  Get.toNamed(AppRoute.addProductScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
