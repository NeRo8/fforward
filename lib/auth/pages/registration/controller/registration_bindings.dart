import 'package:fforward_adm/auth/pages/registration/controller/registration_controllers.dart';
import 'package:fforward_adm/services/fb_auth_service.dart';
import 'package:fforward_adm/services/fb_users_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class RegistrationBindings extends Bindings {
  @override
  void dependencies() {
    final FBAuthService authService = FBAuthService(
      fbService: FirebaseAuth.instance,
    );
    final FBUsersService usersService =
        FBUsersService(fbDB: FirebaseDatabase.instance);

    Get.lazyPut(
      () => RegistrationController(
        authService: authService,
        usersService: usersService,
      ),
    );
  }
}
