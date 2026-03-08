import 'package:course_online/core/models/response_data.dart';
import 'package:course_online/core/services/network_caller.dart';
import 'package:course_online/core/utils/constants/api_constants.dart';

class SignupServices {
  static Future<ResponseData> signup({
    required String fullName,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      "fullName": fullName,
      "email": email,
      "password": password,
    };

    ResponseData response = await NetworkCaller().postRequest(
      ApiConstants.signup,
      body: body,
    );

    return response;
  }
}
