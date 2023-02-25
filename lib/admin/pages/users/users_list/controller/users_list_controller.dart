import 'package:fforward_adm/controller/users_store_controller.dart';
import 'package:fforward_adm/models/users.dart';
import 'package:get/get.dart';

class UsersListController extends GetxController {
  final UsersStoreController _usersStoreController;

  UsersListController({required UsersStoreController usersStoreController})
      : _usersStoreController = usersStoreController;

  List<Users> get usersTable => _usersStoreController.usersList;
}
