import 'package:fforward_adm/services/fb_developer_levels_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class DeveloperLevelsListController extends GetxController {
  final FBDeveloperLevelsService _developerLevelsService;

  DeveloperLevelsListController({developerLevelsService})
      : _developerLevelsService = developerLevelsService;

  DatabaseReference get developerLevelsTable => _developerLevelsService.table;
}
