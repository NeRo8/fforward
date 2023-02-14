import 'package:fforward_adm/admin/pages/developer_levels/developer_levels_detail/view/developer_levels_detail_args.dart';
import 'package:fforward_adm/services/fb_developer_levels_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import 'developer_levels_detail_controller.dart';

class DeveloperLevelsDetailBindings extends Bindings {
  @override
  void dependencies() {
    final FBDeveloperLevelsService developerLevelsService =
        FBDeveloperLevelsService(fbDB: FirebaseDatabase.instance);

    final DeveloperLevelsDetailArgs? args = Get.arguments;

    Get.lazyPut(() => DeveloperLevelsDetailController(
          id: args?.id,
          title: args?.title,
          developerLevelsService: developerLevelsService,
        ));
  }
}
