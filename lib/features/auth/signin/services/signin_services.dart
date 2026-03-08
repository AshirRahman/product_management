import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/core/services/network_caller.dart';
import 'package:course_online/core/utils/constants/api_constants.dart';

class SigninServices {
  static Future<ResponseData> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "fcmToken": "optional-fcm-token",
    };

    ResponseData response = await NetworkCaller().postRequest(
      ApiConstants.signin,
      body: body,
    );

    return response;
  }
}
