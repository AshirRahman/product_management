import 'package:course_online/app.dart';
import 'package:course_online/core/services/storage_service.dart';
import 'package:course_online/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();

  /// Hive init
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>('products');

  runApp(const CourseOnline());
}
