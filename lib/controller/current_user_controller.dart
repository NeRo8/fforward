import 'package:fforward_adm/models/users.dart';
import 'package:fforward_adm/services/fb_auth_service.dart';
import 'package:fforward_adm/services/fb_users_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CurrentUserController extends GetxController {
  final FirebaseAuth _authService;
  final FBUsersService _usersService;

  final Rx<Users?> currentUser = Rx(null);

  CurrentUserController({authService, usersService})
      : _authService = authService,
        _usersService = usersService;

  void onTapLogout() async {
    try {
      await _authService.signOut();
    } catch (e) {
      print(e);
    }
  }
}
