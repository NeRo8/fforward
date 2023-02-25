import 'package:fforward_adm/controller/technologies_store_controller.dart';
import 'package:get/get.dart';

import 'technology_list_controller.dart';

class TechnologyListBindings extends Bindings {
  @override
  void dependencies() {
    final TechnologiesStoreController technologiesStoreController =
        Get.find<TechnologiesStoreController>();

    Get.lazyPut(
      () => TechnologyListController(
          technologiesStoreController: technologiesStoreController),
    );
  }
}
