import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/features/home/controller/home_controller.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';
import '../widget/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final profile = controller.profile.value;

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (Get.isRegistered<HomeController>()) {
                            Get.find<HomeController>().fetchProfile();
                          }
                          Get.offNamed(AppRoute.homeScreen);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Profile",
                            style: getTextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 48.w),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),

                /// Profile Image
                GestureDetector(
                  onTap: controller.editProfile,
                  child: Column(
                    children: [
                      ClipOval(
                        child: SizedBox(
                          width: 90.r,
                          height: 90.r,
                          child: (profile?.profileImage != null &&
                                  profile!.profileImage!.isNotEmpty)
                              ? Image.network(
                                  profile.profileImage!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    color: AppColors.grey300,
                                    child: Icon(Icons.person,
                                        size: 40.sp, color: AppColors.white),
                                  ),
                                  loadingBuilder: (_, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      color: AppColors.grey200,
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2),
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  color: AppColors.grey300,
                                  child: Icon(Icons.person,
                                      size: 40.sp, color: AppColors.white),
                                ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Icon(
                        Icons.edit,
                        size: 18.sp,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  profile?.fullName ?? "-",
                  style: getTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  profile?.email ?? "-",
                  style: getTextStyle(
                    fontSize: 13,
                    color: AppColors.grey,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  profile?.country ?? "-",
                  style: getTextStyle(
                    fontSize: 13,
                    color: AppColors.grey,
                  ),
                ),

                SizedBox(height: 25.h),

                const Divider(),

                ProfileMenuItem(
                  icon: Icons.edit_outlined,
                  title: "Edit Profile",
                  onTap: controller.editProfile,
                ),

                ProfileMenuItem(
                  icon: Icons.settings_outlined,
                  title: "Support",
                  onTap: controller.support,
                ),

                ProfileMenuItem(
                  icon: Icons.lock_outline,
                  title: "Privacy",
                  onTap: controller.privacy,
                ),

                const Divider(),

                ProfileMenuItem(
                  icon: Icons.logout,
                  title: "Logout",
                  color: AppColors.warning,
                  onTap: controller.logout,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
