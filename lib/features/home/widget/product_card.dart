import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/styles/global_text_style.dart';
import '../../../core/common/widgets/app_image.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../routes/app_routes.dart';
import '../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    double finalPrice = product.price;

    /// discount price
    if (product.isDiscounted) {
      finalPrice =
          product.price - (product.price * product.discountPercent / 100);
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE SECTION
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18.r),
                    ),
                    child: AppImage(
                      path: product.image ?? "",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// CATEGORY
                Positioned(
                  top: 10.h,
                  left: 10.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      product.category.toUpperCase(),
                      style: getTextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),

                /// PRICE BADGE
                Positioned(
                  bottom: 8.h,
                  right: 10.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      "\$${finalPrice.toStringAsFixed(2)}",
                      style: getTextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                /// DISCOUNT TAG
                if (product.isDiscounted)
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        "-${product.discountPercent}%",
                        style: getTextStyle(
                          color: AppColors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(height: 8.h),

          /// PRODUCT NAME
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getTextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 4.h),

          /// STOCK STATUS
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Icon(
                  product.stock > 0 ? Icons.check : Icons.close,
                  color:
                      product.stock > 0 ? AppColors.success : AppColors.error,
                  size: 16.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  product.stock > 0 ? "In Stock" : "Out of Stock",
                  style: getTextStyle(
                    fontSize: 11,
                    color:
                        product.stock > 0 ? AppColors.success : AppColors.error,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8.h),

          /// BUTTONS
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Row(
              children: [
                /// VIEW DETAILS
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        AppRoute.productDetailsScreen,
                        arguments: product,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.viewDetailsBg,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          "View Details",
                          style: getTextStyle(
                            fontSize: 11,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 8.w),

                /// EDIT
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRoute.editProductScreen,
                      arguments: product,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.grey300,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      "Edit",
                      style: getTextStyle(
                        fontSize: 11,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
