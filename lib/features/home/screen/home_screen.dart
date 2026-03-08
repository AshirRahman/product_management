import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25.r),
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoute.profileScreen),
                      child: ClipOval(
                        child: SizedBox(
                          width: 40.r,
                          height: 40.r,
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
                    SizedBox(width: 10.w),
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

            SizedBox(height: 15.h),

            /// Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
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

            SizedBox(height: 15.h),

            /// Product Grid
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Obx(
                  () => controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12.h,
                            crossAxisSpacing: 12.w,
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
              padding: EdgeInsets.all(20.w),
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
