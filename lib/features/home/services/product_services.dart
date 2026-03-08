import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/core/services/network_caller.dart';
import 'package:course_online/core/services/storage_service.dart';
import 'package:course_online/core/utils/constants/api_constants.dart';

class ProductServices {
  static Future<ResponseData> getProducts() async {
    ResponseData response = await NetworkCaller().getRequest(
      ApiConstants.getProducts,
      token: StorageService.token,
    );

    return response;
  }
}
