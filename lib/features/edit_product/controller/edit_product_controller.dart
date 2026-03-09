import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/features/home/model/product_model.dart';
import 'package:course_online/features/edit_product/model/edit_product_model.dart';
import 'package:course_online/features/edit_product/services/edit_product_services.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProductController extends GetxController {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final brandController = TextEditingController();
  final discountController = TextEditingController();
  final weightController = TextEditingController();
  final dimensionController = TextEditingController();
  final categoryController = TextEditingController();
  final stockController = TextEditingController();
  final tagController = TextEditingController();
  final colorController = TextEditingController();

  RxBool isLoading = false.obs;
  RxString imagePath = "".obs;

  late String productId;

  @override
  void onInit() {
    super.onInit();
    final ProductModel product = Get.arguments as ProductModel;
    productId = product.id;
    nameController.text = product.name;
    descriptionController.text = product.description;
    priceController.text = product.price.toString();
    brandController.text = product.brand;
    discountController.text = product.discountPercent.toString();
    stockController.text = product.stock.toString();
    categoryController.text = product.category;
  }

  Future<void> pickImage() async {
    final XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (file != null) {
      imagePath.value = file.path;
    }
  }

  Future<void> submitProduct() async {
    if (nameController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty ||
        priceController.text.trim().isEmpty ||
        stockController.text.trim().isEmpty ||
        categoryController.text.trim().isEmpty) {
      return;
    }

    isLoading.value = true;

    final model = EditProductModel(
      name: nameController.text.trim(),
      description: descriptionController.text.trim(),
      price: priceController.text.trim(),
      brand: brandController.text.trim(),
      discount: discountController.text.trim(),
      stock: stockController.text.trim(),
      category: categoryController.text.trim(),
      tag: tagController.text.trim(),
      color: colorController.text.trim(),
      weight: weightController.text.trim(),
      dimension: dimensionController.text.trim(),
      status: "",
    );

    ResponseData response = await EditProductServices.updateProduct(
      productId,
      model,
      imagePath: imagePath.value.isEmpty ? null : imagePath.value,
    );

    isLoading.value = false;

    if (response.isSuccess) {
      Get.offAllNamed(AppRoute.homeScreen);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    brandController.dispose();
    discountController.dispose();
    weightController.dispose();
    dimensionController.dispose();
    categoryController.dispose();
    stockController.dispose();
    tagController.dispose();
    colorController.dispose();
    super.onClose();
  }
}
