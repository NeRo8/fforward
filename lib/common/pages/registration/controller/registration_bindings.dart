import 'package:fforward_adm/common/pages/registration/controller/registration_controllers.dart';
import 'package:get/get.dart';

class RegistrationBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RegistrationController());
  }
}
