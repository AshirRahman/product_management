import 'dart:convert';
import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/core/services/network_caller.dart';
import 'package:course_online/core/services/storage_service.dart';
import 'package:course_online/core/utils/constants/api_constants.dart';

class SetupProfileService {
  static Future<ResponseData> updateProfile({
    required String fullName,
    required String country,
    String? imagePath,
  }) async {
    final Map<String, dynamic> data = {
      "fullName": fullName,
      "country": country,
    };

    return await NetworkCaller().multipartPutRequest(
      ApiConstants.setupProfile,
      dataJson: jsonEncode(data),
      filePath: imagePath,
      token: StorageService.token,
    );
  }
}
