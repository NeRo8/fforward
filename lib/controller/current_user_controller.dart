import 'package:fforward_adm/models/users.dart';
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

  bool get getCurrentUserIsAdmin => currentUser.value?.isAdmin ?? false;
  String get getCurrentUserFullname => currentUser.value?.fullname ?? "None";

  Future<void> updateCurrentUser(String? uid) async {
    try {
      if (uid != null) {
        final Map data = await _usersService.getUserById(uid).then((snapshot) {
          return snapshot.value as Map;
        });
        currentUser.value = Users.fromJson(data);
      } else {
        currentUser.value = null;
      }
    } catch (e) {
      print(e);
    }
  }

  void onTapLogout() async {
    try {
      await _authService.signOut();
      currentUser.value = null;
    } catch (e) {
      print(e);
    }
  }
}
