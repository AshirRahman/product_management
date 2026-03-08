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
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// Profile Image
            GestureDetector(
              onTap: controller.editProfile,
              child: const Column(
                children: [

                  CircleAvatar(
                    radius: 45,
                    backgroundImage:
                        AssetImage("assets/images/profile.png"),
                  ),

                  SizedBox(height: 8),

                  Icon(
                    Icons.edit,
                    size: 18,
                    color: Color(0xff2D6CDF),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              controller.userName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 25),

            const Divider(),

            /// Menu Items
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
              color: Colors.orange,
              onTap: controller.logout,
            ),

          ],
        ),
      ),
    );
  }
}