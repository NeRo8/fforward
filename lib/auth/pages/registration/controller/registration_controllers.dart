import 'package:fforward_adm/models/users.dart';
import 'package:fforward_adm/services/fb_auth_service.dart';
import 'package:fforward_adm/services/fb_users_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final FBAuthService _authService;
  final FBUsersService _usersService;

  final GlobalKey<FormState> regFormKey = GlobalKey<FormState>();

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegistrationController({authService, usersService})
      : _authService = authService,
        _usersService = usersService;

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
      if (!regFormKey.currentState!.validate()) return;
      final UserCredential response = await _authService.onSignUp(
        emailController.text,
        passwordController.text,
      );

      if (response.user != null) {
        await _usersService.createUser(
          Users(
            uid: response.user!.uid,
            firstname: firstnameController.text,
            lastname: lastnameController.text,
            email: emailController.text,
            permission: UsersPermission.worker,
          ),
        );
      }
    } on FirebaseAuthException catch (err) {
      Get.snackbar(
        "Error",
        err.message ?? err.code,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
