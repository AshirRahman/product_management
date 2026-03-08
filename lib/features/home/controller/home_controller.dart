import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/features/profile/model/profile_model.dart';
import 'package:course_online/features/profile/services/profile_service.dart';
import 'package:get/get.dart';
import '../model/product_model.dart';
import '../services/product_services.dart';

class HomeController extends GetxController {
  RxInt selectedTab = 0.obs;
  RxBool isLoading = false.obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  Rx<ProfileModel?> profile = Rx<ProfileModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    fetchProfile();
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

  Future<void> fetchProfile() async {
    ResponseData response = await ProfileService.getProfile();
    if (response.isSuccess) {
      profile.value = ProfileModel.fromJson(response.responseData['data']);
    }
  }
}
