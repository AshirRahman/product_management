import 'package:course_online/features/auth/verify_code/screen/verify_code_screen.dart';
import 'package:get/get.dart';
import '../features/add_product/screen/add_product_screen.dart';
import '../features/auth/forgot_password/screen/forgot_password_screen.dart';
import '../features/auth/reset_password/screen/reset_password_screen.dart';
import '../features/auth/signin/screen/signin_screen.dart';
import '../features/auth/signup/screen/signup_screen.dart';
import '../features/edit_product/screen/edit_product_screen.dart';
import '../features/enable_location/screen/enable_location_screen.dart';
import '../features/home/screen/home_screen.dart';
import '../features/onboarding/screen/onboarding_screen.dart';
import '../features/product_details/screen/product_details_screen.dart';
import '../features/profile/screen/profile_screen.dart';
import '../features/select_language/screen/select_language_screen.dart';
import '../features/splash/screen/splash_screen.dart';
import '../features/update_profile/screen/setup_profile_screen.dart';

class AppRoute {
  static const String splashScreen = "/splash";
  static const String onboardingScreen = "/onboarding";
  static const String loginScreen = "/login";
  static const String signinScreen = "/signin";
  static const String signUpScreen = "/signup";
  static const String forgotPasswordScreen = "/forgot-password";
  static const String verifyCodeScreen = "/verify-code";
  static const String resetPasswordScreen = "/reset-password";
  static const String selectLanguageScreen = "/select-language";
  static const String enableLocationScreen = "/enable-location";
  static const String setupProfileScreen = "/setup-profile";
  static const String homeScreen = "/home";
  static const String profileScreen = "/profile";
  static const String addProductScreen = "/add-product";
  static const String editProductScreen = "/edit-product";
  static const String productDetailsScreen = "/product-details";

  static String getHomeScreen() => homeScreen;
  static String getSigninScreen() => signinScreen;
  static String getSignUpScreen() => signUpScreen;
  static String getSetupProfileScreen() => setupProfileScreen;
  static String getSplashScreen() => splashScreen;
  static String getOnboardingScreen() => onboardingScreen;
  static String getForgotPasswordScreen() => forgotPasswordScreen;
  static String getVerifyCodeScreen() => verifyCodeScreen;
  static String getResetPasswordScreen() => resetPasswordScreen;
  static String getSelectLanguageScreen() => selectLanguageScreen;
  static String getEnableLocationScreen() => enableLocationScreen;
  static String getProfileScreen() => profileScreen;
  static String getAddProductScreen() => addProductScreen;
  static String getEditProductScreen() => editProductScreen;
  static String getProductDetailsScreen() => productDetailsScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: loginScreen, page: () => SigninScreen()),
    GetPage(name: signinScreen, page: () => SigninScreen()),
    GetPage(name: signUpScreen, page: () => SignupScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: verifyCodeScreen, page: () => VerifyCodeScreen()),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
    GetPage(name: selectLanguageScreen, page: () => SelectLanguageScreen()),
    GetPage(name: enableLocationScreen, page: () => EnableLocationScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: setupProfileScreen, page: () => SetupProfileScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen()),
    GetPage(name: addProductScreen, page: () => AddProductScreen()),
    GetPage(
        name: editProductScreen,
        page: () => EditProductScreen(),
        preventDuplicates: false),
    GetPage(name: productDetailsScreen, page: () => ProductDetailsScreen()),
  ];
}
