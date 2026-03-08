import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../model/add_product_model.dart';
import '../services/add_product_services.dart';

class AddProductController extends GetxController {
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
      Get.snackbar("Error", "Please fill in all required fields");
      return;
    }

    isLoading.value = true;

    final model = AddProductModel(
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

    ResponseData response = await AddProductServices.createProduct(
      model,
      imagePath: imagePath.value.isEmpty ? null : imagePath.value,
    );

    isLoading.value = false;

    if (response.isSuccess) {
      _clearFields();
      Get.snackbar("Success", "Product created successfully");
      Get.offAllNamed(AppRoute.homeScreen);
    } else {
      Get.snackbar("Error", response.errorMessage);
    }
  }

  void _clearFields() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    brandController.clear();
    discountController.clear();
    weightController.clear();
    dimensionController.clear();
    categoryController.clear();
    stockController.clear();
    tagController.clear();
    colorController.clear();
    imagePath.value = "";
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
