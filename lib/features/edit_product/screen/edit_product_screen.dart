import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/common/widgets/custom_textfield.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/edit_product_controller.dart';
import '../widget/upload_photo_widget.dart';

class EditProductScreen extends StatelessWidget {
  EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<EditProductController>(force: true);
    final controller = Get.put(EditProductController());
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            /// AppBar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.offNamed(AppRoute.homeScreen),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Spacer(),
                  const Text(
                    "Edit Product",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(
                        () => UploadPhotoWidget(
                          onTap: controller.pickImage,
                          imagePath: controller.imagePath.value.isEmpty
                              ? null
                              : controller.imagePath.value,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: "Product Name",
                        hintText: "Type product name",
                        controller: controller.nameController,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        label: "Description",
                        hintText: "Type description",
                        controller: controller.descriptionController,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        label: "Price",
                        hintText: "Type price",
                        controller: controller.priceController,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        label: "Brand",
                        hintText: "Type brand",
                        controller: controller.brandController,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        label: "Category",
                        hintText: "e.g. Electronics",
                        controller: controller.categoryController,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        label: "Stock",
                        hintText: "Type stock quantity",
                        controller: controller.stockController,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        label: "Discount (%)",
                        hintText: "Type discount percent",
                        controller: controller.discountController,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        label: "Weight",
                        hintText: "Type weight",
                        controller: controller.weightController,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        label: "Dimensions",
                        hintText: "Type dimensions",
                        controller: controller.dimensionController,
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        title: "Submit",
                        onTap: controller.submitProduct,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
