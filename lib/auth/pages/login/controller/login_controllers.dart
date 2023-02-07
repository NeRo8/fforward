import 'package:fforward_adm/services/fb_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FBAuthService _authService;

  final GlobalKey<FormState> logFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginController({authService}) : _authService = authService;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  Future<void> onTapSubmit() async {
    try {
      if (!logFormKey.currentState!.validate()) return;

      await _authService.onSignIn(
        emailController.text,
        passwordController.text,
      );
    } on FirebaseAuthException catch (err) {
      Get.snackbar(
        "Error",
        err.message ?? err.code,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
