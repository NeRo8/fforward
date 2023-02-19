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

  @override
  void onReady() {
    super.onReady();

    _usersService.getUserById(_authService.currentUser!.uid).then((snapshot) {
      final Map data = snapshot.value as Map;

      currentUser.value = Users.fromJson(data);
    });
  }

  bool get getCurrentUserIsAdmin => currentUser.value?.isAdmin ?? false;
  String get getCurrentUserFullname => currentUser.value?.fullname ?? "None";

  void onTapLogout() async {
    try {
      await _authService.signOut();
      currentUser.value = null;
    } catch (e) {
      print(e);
    }
  }
}
