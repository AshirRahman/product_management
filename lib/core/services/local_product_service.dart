import 'package:hive/hive.dart';
import 'package:course_online/features/home/model/product_model.dart';

class LocalProductService {
  static const String _boxName = 'products';

  static Future<void> saveProducts(List<ProductModel> products) async {
    final box = Hive.box<ProductModel>(_boxName);
    await box.clear();
    await box.addAll(products);
  }

  static List<ProductModel> getProducts() {
    final box = Hive.box<ProductModel>(_boxName);
    return box.values.toList();
  }

  static Future<void> clearProducts() async {
    final box = Hive.box<ProductModel>(_boxName);
    await box.clear();
  }
}
