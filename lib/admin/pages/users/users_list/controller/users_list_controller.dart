import 'package:fforward_adm/services/fb_users_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class UsersListController extends GetxController {
  final FBUsersService _usersService;

  UsersListController({usersService}) : _usersService = usersService;

  DatabaseReference get usersTable => _usersService.table;
}
