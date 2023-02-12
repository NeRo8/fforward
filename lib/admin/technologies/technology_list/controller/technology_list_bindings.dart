import 'package:fforward_adm/services/fb_technology_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import 'technology_list_controller.dart';

class TechnologyListBindings extends Bindings {
  @override
  void dependencies() {
    final FBTechnologyService technologyService =
        FBTechnologyService(fbDB: FirebaseDatabase.instance);

    Get.lazyPut(
      () => TechnologyListController(technologyService: technologyService),
    );
  }
}
