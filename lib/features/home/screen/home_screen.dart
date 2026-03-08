import 'package:course_online/core/common/widgets/custom_button.dart';
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
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            /// Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xff2D6CDF),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        const AssetImage("assets/images/profile.png"),
                    onBackgroundImageError: (_, __) {},
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, Wade Warren!",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Golder Avenue, Abuja",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 15),

            /// Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Services",
                  style: TextStyle(
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
