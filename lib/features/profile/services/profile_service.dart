import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/core/services/network_caller.dart';
import 'package:course_online/core/services/storage_service.dart';
import 'package:course_online/core/utils/constants/api_constants.dart';

class ProfileService {
  static Future<ResponseData> getProfile() async {
    return await NetworkCaller().getRequest(
      ApiConstants.profile,
      token: StorageService.token,
    );
  }
}
