import 'package:fforward_adm/services/fb_technology_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class TechnologyListController extends GetxController {
  final FBTechnologyService _technologyService;

  TechnologyListController({technologyService})
      : _technologyService = technologyService;

  DatabaseReference get technologyTable => _technologyService.table;
}
