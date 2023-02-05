import 'package:fforward_adm/services/fb_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final FBAuthService _authService;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegistrationController({authService}) : _authService = authService;

  @override
  onClose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }

  Future<void> onTabSubmit() async {
    try {
      if (!formKey.currentState!.validate()) return;

      final UserCredential user = await _authService.onSignUp(
          emailController.text, passwordController.text);
    } on FirebaseAuthException catch (err) {
      Get.snackbar("Error", err.message ?? err.code);
    }
  }
}
