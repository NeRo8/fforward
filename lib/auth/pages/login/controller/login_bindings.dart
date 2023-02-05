import 'package:fforward_adm/auth/pages/login/controller/login_controllers.dart';
import 'package:fforward_adm/services/fb_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    final FBAuthService authService = FBAuthService(
      fbService: FirebaseAuth.instance,
    );

    Get.lazyPut(
      () => LoginController(authService: authService),
    );
  }
}
