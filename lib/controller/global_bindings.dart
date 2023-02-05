import 'package:fforward_adm/controller/global_controller.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    final FirebaseAuth fbAuthService = FirebaseAuth.instance;

    Get.put(GlobalController(fbAuthService: fbAuthService));
  }
}
