import 'package:fforward_adm/admin/pages/users/users_list/controller/users_list_controller.dart';
import 'package:fforward_adm/controller/users_store_controller.dart';

import 'package:get/get.dart';

class UsersListBindings extends Bindings {
  @override
  void dependencies() {
    final UsersStoreController usersStoreController =
        Get.find<UsersStoreController>();

    Get.lazyPut(
      () => UsersListController(usersStoreController: usersStoreController),
    );
  }
}
