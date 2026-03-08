import 'dart:convert';
import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/core/services/network_caller.dart';
import 'package:course_online/core/services/storage_service.dart';
import 'package:course_online/core/utils/constants/api_constants.dart';
import '../model/edit_product_model.dart';

class EditProductServices {
  static Future<ResponseData> updateProduct(
    String productId,
    EditProductModel model, {
    String? imagePath,
  }) async {
    ResponseData response = await NetworkCaller().multipartPutRequest(
      ApiConstants.updateProduct(productId),
      dataJson: jsonEncode(model.toJson()),
      filePath: imagePath,
      token: StorageService.token,
    );
    return response;
  }
}
