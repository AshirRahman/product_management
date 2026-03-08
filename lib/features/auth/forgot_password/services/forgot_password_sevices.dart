import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/core/services/network_caller.dart';
import 'package:course_online/core/utils/constants/api_constants.dart';

class ForgotPasswordServices {
  static Future<ResponseData> sendOtp({
    required String email,
  }) async {
    Map<String, String> body = {
      "email": email,
    };

    ResponseData response = await NetworkCaller().postRequest(
      ApiConstants.forgotPassword,
      body: body,
    );

    return response;
  }
}
