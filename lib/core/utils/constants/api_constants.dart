class ApiConstants {
  ApiConstants._();

  static const String rootUrl =
      "https://product-management-seven-xi.vercel.app";
  static const String apiPrefix = "/api/v1";
  static const String baseUrl = "$rootUrl$apiPrefix";

  /// Auth
  static const String signup = "$baseUrl/users/register";
  static const String signin = "$baseUrl/auth/login";
  static const String verifyOtp = "$baseUrl/auth/verify-otp";
  static const String forgotPassword = "$baseUrl/auth/forgot-password";
  static const String resetPassword = "$baseUrl/auth/reset-password";

  /// Products
  static const String getProducts = "$baseUrl/products";
  static String productById(String id) => "$baseUrl/products/$id";
  static const String createProduct = "$baseUrl/products";
  static String updateProduct(String id) => "$baseUrl/products/$id/update";
  static String deleteProduct(String id) => "$baseUrl/products/$id/delete";

  /// Profile
  static const String profile = "$baseUrl/user/profile";
  static const String setupProfile = "$baseUrl/users/complete-profile";
}
