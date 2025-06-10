import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/utils/app_routes.dart';

class AuthController extends GetxController {
  final _supabaseInstance = Supabase.instance.client;
  User? get user => _supabaseInstance.auth.currentUser;

  // Reactive variables for state management
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var showPassword = false.obs;

  // Update name on change
  void nameOnChanged(String val) {
    name.value = val;
  }

  // Validate name
  String? nameValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  // Update email on change
  void emailOnChanged(String val) {
    email.value = val;
  }

  // Validate email
  String? emailValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your email';
    } else if (!GetUtils.isEmail(val)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Update password on change
  void passwordOnChanged(String val) {
    password.value = val;
  }

  // Validate password
  String? passwordValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a password';
    } else if (val.length < 6) {
      return 'Password should be at least 6 characters long';
    }
    return null;
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
    update([kLogin, kRegister]);
  }

  // Sign in with email and password
  Future signIn() async {
    try {
      await _supabaseInstance.auth.signInWithPassword(
        email: email.value,
        password: password.value,
      );
      Get.offAllNamed(AppRoutes.home);
    } on AuthException catch (error) {
      kDefaultDialog("Error", error.message);
    } catch (error) {
      kDefaultDialog("Error", 'Some Unknown Error occurred');
    }
  }

  // Sign up with name, email, and password
  Future signUp() async {
    try {
      final response = await _supabaseInstance.auth.signUp(
        email: email.value,
        password: password.value,
      );
      if (response.session != null) {
        await _supabaseInstance.from('Users').insert({
          'Name': name.value,
          'Email': email.value,
          'Uid': response.session!.user.id,
          'favoritesList': [],
          'cartList': [],
        });
        Get.offAllNamed(AppRoutes.home);
      }
    } on AuthException catch (error) {
      kDefaultDialog("Error", error.message);
    } catch (error) {
      kDefaultDialog("Error", 'Some Unknown Error occurred');
    }
  }

  // Forgot password using email
  Future forgotPassword() async {
    if (GetUtils.isEmail(email.value)) {
      await _supabaseInstance.auth.resetPasswordForEmail(
        email.value,
      );
      Get.snackbar(
        "Password reset",
        "Password reset request has been sent successfully.",
      );
    } else {
      kDefaultDialog("Error", "Please enter a valid email");
    }
  }

  // Navigate to ForgotPasswordScreen
  void toForgotPasswordScreen() {
    Get.toNamed(
      AppRoutes.forgotPassword,
    );
  }

  // Navigate to RegisterScreen
  void toRegisterScreen() {
    Get.toNamed(
      AppRoutes.register,
    );
  }

  // Navigate to LoginScreen
  void toLoginScreen() {
    Get.toNamed(
      AppRoutes.login,
    );
  }

  // Sign in with Google
  Future signInWithGoogle() async {
    try {
      await _supabaseInstance.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'io.supabase.flutterquickstart://login-callback/',
      );
    } catch (error) {
      kDefaultDialog("Error", "Google Sign-In failed");
    }
  }

  // Sign in with Facebook
  Future signInWithFacebook() async {
    try {
      await _supabaseInstance.auth.signInWithOAuth(
        OAuthProvider.facebook,
        redirectTo: 'io.supabase.flutterquickstart://login-callback/',
      );
    } catch (error) {
      kDefaultDialog("Error", "Facebook Sign-In failed");
    }
  }

  // Sign in with Apple
  Future signInWithApple() async {
    try {
      await _supabaseInstance.auth.signInWithOAuth(
        OAuthProvider.apple,
        redirectTo: 'io.supabase.flutterquickstart://login-callback/',
      );
    } catch (error) {
      kDefaultDialog("Error", "Apple Sign-In failed");
    }
  }
}
