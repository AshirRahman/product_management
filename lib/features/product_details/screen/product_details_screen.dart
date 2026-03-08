import 'package:course_online/core/common/styles/global_text_style.dart';
import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/utils/constants/colors.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/product_details_controller.dart';
import '../widget/product_header.dart';
import '../widget/product_info_tag.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  final controller = Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    final product = controller.product;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            /// AppBar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.offNamed(AppRoute.homeScreen),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Spacer(),
                  Text(
                    "Service Detail",
                    style: getTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.delete,
                    color: AppColors.error,
                  )
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Image
                      ProductHeader(
                        image: product.image ?? "",
                      ),

                      SizedBox(height: 15.h),

                      /// Title + Price
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product.name,
                              style: getTextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "\$${product.price.toStringAsFixed(2)}",
                            style: getTextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 10.h),

                      Text(
                        product.stock > 0 ? "✓ In Stock" : "✗ Out of Stock",
                        style: getTextStyle(
                          color: product.stock > 0
                              ? AppColors.success
                              : AppColors.error,
                        ),
                      ),

                      SizedBox(height: 20.h),

                      Text(
                        product.name,
                        style: getTextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10.h),

                      Wrap(
                        spacing: 10.w,
                        runSpacing: 10.h,
                        children: [
                          ProductInfoTag(title: "${product.category} Category"),
                          ProductInfoTag(title: product.brand),
                          if (product.isDiscounted)
                            ProductInfoTag(
                                title: "${product.discountPercent}% Off"),
                          ProductInfoTag(title: "Stock: ${product.stock}"),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      Text(
                        "Description",
                        style: getTextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      Text(
                        product.description,
                        style: getTextStyle(
                          color: AppColors.grey,
                        ),
                      ),

                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20.w),
              child: CustomButton(
                title: "Edit Product",
                onTap: () => Get.toNamed(
                  AppRoute.editProductScreen,
                  arguments: product,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
