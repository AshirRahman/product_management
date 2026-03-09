import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/core/services/local_product_service.dart';
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
    loadProducts();
    fetchProfile();
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }

  /// Load products: try API first, fallback to local Hive cache
  Future<void> loadProducts() async {
    isLoading.value = true;

    // Show cached data immediately if available
    final cached = LocalProductService.getProducts();
    if (cached.isNotEmpty) {
      products.value = cached;
    }

    // Fetch from API
    ResponseData response = await ProductServices.getProducts();
    isLoading.value = false;

    if (response.isSuccess) {
      List data = response.responseData["data"];
      final fetched = data.map((e) => ProductModel.fromJson(e)).toList();
      products.value = fetched;

      // Save to Hive for offline use
      await LocalProductService.saveProducts(fetched);
    }
  }

  Future<void> fetchProducts() async {
    await loadProducts();
  }

  Future<void> fetchProfile() async {
    ResponseData response = await ProfileService.getProfile();
    if (response.isSuccess) {
      profile.value = ProfileModel.fromJson(response.responseData['data']);
    }
  }
}
