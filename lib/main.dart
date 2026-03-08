import 'package:course_online/app.dart';
import 'package:course_online/core/services/storage_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(const CourseOnline());
}
