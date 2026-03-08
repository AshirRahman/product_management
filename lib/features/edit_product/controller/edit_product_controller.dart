import 'package:course_online/features/home/model/product_model.dart';
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

  RxString tag = "".obs;
  RxString status = "".obs;
  RxString color = "".obs;
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

  void submitProduct() {
    /// API call later
    Get.snackbar("Success", "Product updated");
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
    super.onClose();
  }
}
