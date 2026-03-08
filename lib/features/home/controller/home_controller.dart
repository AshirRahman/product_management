import 'package:course_online/core/models/response_data.dart';
import 'package:get/get.dart';
import '../model/product_model.dart';
import '../services/product_services.dart';

class HomeController extends GetxController {
  RxInt selectedTab = 0.obs;
  RxBool isLoading = false.obs;

  RxList<ProductModel> products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;

    ResponseData response = await ProductServices.getProducts();

    isLoading.value = false;

    if (response.isSuccess) {
      List data = response.responseData["data"];

      products.value = data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      Get.snackbar("Error", response.errorMessage);
    }
  }
}
