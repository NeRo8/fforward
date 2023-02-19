import 'package:fforward_adm/client/pages/dashboard/view/dashboard_page.dart';
import 'package:fforward_adm/auth/pages/login/view/login_page.dart';
import 'package:fforward_adm/controller/current_user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final FirebaseAuth _fbAuthService;
  final CurrentUserController _currentUserController;

  GlobalController({fbAuthService, currentUserController})
      : _fbAuthService = fbAuthService,
        _currentUserController = currentUserController;

  @override
  void onReady() {
    super.onReady();

    _fbAuthService.authStateChanges().listen((User? user) async {
      if (user != null) {
        await _currentUserController.updateCurrentUser(user.uid);
        Get.offAllNamed(DashboardPage.routeName);
      } else {
        await _currentUserController.updateCurrentUser(null);
        Get.offAllNamed(LoginPage.routeName);
      }
    });
  }
}
