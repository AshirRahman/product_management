import 'package:course_online/features/home/model/product_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  late ProductModel product;

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as ProductModel;
  }
}
