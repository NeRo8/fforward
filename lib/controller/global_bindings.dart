import 'package:fforward_adm/controller/current_user_controller.dart';
import 'package:fforward_adm/controller/global_controller.dart';
import 'package:fforward_adm/services/fb_users_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    final CurrentUserController currentUserController = CurrentUserController(
      authService: FirebaseAuth.instance,
      usersService: FBUsersService(fbDB: FirebaseDatabase.instance),
    );

    Get.put(currentUserController);
    Get.put(
      GlobalController(
        fbAuthService: FirebaseAuth.instance,
        currentUserController: currentUserController,
      ),
    );
  }
}
