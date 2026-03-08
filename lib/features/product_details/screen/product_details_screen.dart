import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: const Color(0xffF5F6FA),

      body: SafeArea(
        child: Column(
          children: [

            /// AppBar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),

              child: Row(
                children: [

                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  ),

                  const Spacer(),

                  const Text(
                    "Service Detail",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const Spacer(),

                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )

                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// Image
                      ProductHeader(
                        image: product.image,
                      ),

                      const SizedBox(height: 15),

                      /// Title + Price
                      Row(
                        children: [

                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const Spacer(),

                          Text(
                            product.price,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )

                        ],
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "✓ In Stock",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Corsair Gaming Headphones",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [

                          ProductInfoTag(
                            title: "Peripherals Categorie",
                          ),

                          ProductInfoTag(
                            title: "Gaming",
                          ),

                          ProductInfoTag(
                            title: "Corsair Brand",
                          ),

                          ProductInfoTag(
                            title: "Weight: 0.9",
                          ),

                          ProductInfoTag(
                            title: "Dimensions: 45 x 13 x 2.5 cm",
                          ),

                        ],
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        product.description,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 40),

                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),

              child: CustomButton(
                title: "Edit Product",
                onTap: () {},
              ),
            )

          ],
        ),
      ),
    );
  }
}