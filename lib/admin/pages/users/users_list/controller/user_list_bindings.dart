import 'package:fforward_adm/admin/pages/users/users_list/controller/users_list_controller.dart';
import 'package:fforward_adm/services/fb_users_service.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:get/get.dart';

class UsersListBindings extends Bindings {
  @override
  void dependencies() {
    final FBUsersService usersService = FBUsersService(
      fbDB: FirebaseDatabase.instance,
    );

    Get.lazyPut(
      () => UsersListController(usersService: usersService),
    );
  }
}
