import 'package:fforward_adm/admin/pages/technologies/technology_detail/view/technology_detail_args.dart';
import 'package:fforward_adm/services/fb_technology_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import 'technology_detail_controller.dart';

class TechnologyDetailBindings extends Bindings {
  @override
  void dependencies() {
    final FBTechnologyService technologyService =
        FBTechnologyService(fbDB: FirebaseDatabase.instance);

    final TechnologyDetailArgs? args = Get.arguments;

    Get.lazyPut(() => TechnologyDetailController(
          id: args?.id,
          title: args?.title,
          technologyService: technologyService,
        ));
  }
}
