import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/core/services/network_caller.dart';

import 'package:course_online/core/utils/constants/api_constants.dart';

class VerifyCodeServices {
  static Future<ResponseData> verifyOtp({
    required String email,
    required String otp,
  }) async {
    Map<String, dynamic> body = {
      "email": email,
      "otp": int.parse(otp),
    };

    ResponseData response = await NetworkCaller().postRequest(
      ApiConstants.verifyOtp,
      body: body,
    );

    return response;
  }
}
