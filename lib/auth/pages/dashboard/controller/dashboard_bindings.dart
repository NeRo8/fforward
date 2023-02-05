import 'package:fforward_adm/auth/pages/dashboard/controller/dashboard_controllers.dart';
import 'package:fforward_adm/services/fb_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    final FBAuthService authService =
        FBAuthService(fbService: FirebaseAuth.instance);

    Get.lazyPut(() => DashboardController(authService: authService));
  }
}
