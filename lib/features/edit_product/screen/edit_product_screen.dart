import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/common/widgets/custom_textfield.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/edit_product_controller.dart';
import '../widget/upload_photo_widget.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<EditProductController>(force: true);
    final controller = Get.put(EditProductController());
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            /// AppBar
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.offNamed(AppRoute.homeScreen),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Spacer(),
                  Text(
                    "Edit Product",
                    style: getTextStyle(
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
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                      SizedBox(height: 20.h),
                      CustomTextField(
                        label: "Product Name",
                        hintText: "Type product name",
                        controller: controller.nameController,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        label: "Description",
                        hintText: "Type description",
                        controller: controller.descriptionController,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        label: "Price",
                        hintText: "Type price",
                        controller: controller.priceController,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        label: "Brand",
                        hintText: "Type brand",
                        controller: controller.brandController,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        label: "Category",
                        hintText: "e.g. Electronics",
                        controller: controller.categoryController,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        label: "Stock",
                        hintText: "Type stock quantity",
                        controller: controller.stockController,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        label: "Discount (%)",
                        hintText: "Type discount percent",
                        controller: controller.discountController,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        label: "Weight",
                        hintText: "Type weight",
                        controller: controller.weightController,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        label: "Dimensions",
                        hintText: "Type dimensions",
                        controller: controller.dimensionController,
                      ),
                      SizedBox(height: 30.h),
                      Obx(
                        () => CustomButton(
                          title: controller.isLoading.value
                              ? "Submitting..."
                              : "Submit",
                          onTap: controller.isLoading.value
                              ? () {}
                              : controller.submitProduct,
                        ),
                      ),
                      SizedBox(height: 20.h),
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
