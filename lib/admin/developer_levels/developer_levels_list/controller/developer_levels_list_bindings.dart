import 'package:fforward_adm/admin/developer_levels/developer_levels_list/controller/developer_levels_list_controller.dart';
import 'package:fforward_adm/services/fb_developer_levels_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class DeveloperLevelsListBindings extends Bindings {
  @override
  void dependencies() {
    final FBDeveloperLevelsService developerLevelsService =
        FBDeveloperLevelsService(fbDB: FirebaseDatabase.instance);

    Get.lazyPut(
      () => DeveloperLevelsListController(
          developerLevelsService: developerLevelsService),
    );
  }
}
