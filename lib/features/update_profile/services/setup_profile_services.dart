import 'dart:convert';
import 'package:course_online/core/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class SetupProfileService {
  static Future<bool> completeProfile({
    required String token,
    required String about,
    required String dob,
    required String gender,
    required String imagePath,
  }) async {
    var request = http.MultipartRequest(
      "PUT",
      Uri.parse(ApiConstants.setupProfile),
    );

    request.headers["Authorization"] = token;

    /// JSON data
    Map<String, dynamic> data = {
      "about": about,
      "dateOfBirth": dob,
      "gender": gender,
    };

    request.fields["data"] = jsonEncode(data);

    /// Image
    request.files.add(
      await http.MultipartFile.fromPath("image", imagePath),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
