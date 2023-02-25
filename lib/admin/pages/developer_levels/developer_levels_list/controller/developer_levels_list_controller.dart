import 'package:fforward_adm/controller/developer_levels_store_controller.dart';
import 'package:fforward_adm/models/developer_level.dart';

import 'package:get/get.dart';

class DeveloperLevelsListController extends GetxController {
  final DeveloperLevelsStoreController _developerLevelsStoreController;

  DeveloperLevelsListController({developerLevelsStoreController})
      : _developerLevelsStoreController = developerLevelsStoreController;

  List<DeveloperLevel> get developerLevelTable =>
      _developerLevelsStoreController.developerLevelsList;
}
