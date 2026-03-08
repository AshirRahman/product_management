import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
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

          return Column(
            children: [
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.offNamed(AppRoute.homeScreen),
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
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// Profile Image
              GestureDetector(
                onTap: controller.editProfile,
                child: Column(
                  children: [
                    ClipOval(
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: (profile?.profileImage != null &&
                                profile!.profileImage!.isNotEmpty)
                            ? Image.network(
                                profile.profileImage!,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  color: AppColors.grey300,
                                  child: const Icon(Icons.person,
                                      size: 40, color: AppColors.white),
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
                                child: const Icon(Icons.person,
                                    size: 40, color: AppColors.white),
                              ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Icon(
                      Icons.edit,
                      size: 18,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Text(
                profile?.fullName ?? "-",
                style: getTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                profile?.email ?? "-",
                style: getTextStyle(
                  fontSize: 13,
                  color: AppColors.grey,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                profile?.country ?? "-",
                style: getTextStyle(
                  fontSize: 13,
                  color: AppColors.grey,
                ),
              ),

              const SizedBox(height: 25),

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
          );
        }),
      ),
    );
  }
}
