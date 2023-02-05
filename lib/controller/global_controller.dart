import 'package:fforward_adm/auth/pages/dashboard/view/dashboard_page.dart';
import 'package:fforward_adm/auth/pages/login/view/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final FirebaseAuth _fbAuthService;

  GlobalController({fbAuthService}) : _fbAuthService = fbAuthService;

  @override
  void onReady() {
    super.onReady();

    _fbAuthService.authStateChanges().listen((User? user) {
      if (user != null) {
        Get.offNamed(DashboardPage.routeName);
      } else {
        Get.offNamed(LoginPage.routeName);
      }
    });
  }
}
