import 'package:fforward_adm/controller/developer_levels_store_controller.dart';
import 'package:fforward_adm/models/developer_level.dart';
import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/services/fb_developer_levels_service.dart';
import 'package:get/get.dart';

class DeveloperLevelsListController extends GetxController {
  final FBDeveloperLevelsService _developerLevelsService;
  final DeveloperLevelsStoreController _developerLevelsStoreController;

  DeveloperLevelsListController(
      {developerLevelsService, developerLevelsStoreController})
      : _developerLevelsService = developerLevelsService,
        _developerLevelsStoreController = developerLevelsStoreController;

  List<DeveloperLevel> get developerLevelTable =>
      _developerLevelsStoreController.developerLevels;

  void deleteDeveloperLevel(ListItem value) =>
      _developerLevelsService.deleteDeveloperLevelById(value.id);
}
