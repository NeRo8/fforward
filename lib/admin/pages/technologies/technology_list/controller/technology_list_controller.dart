import 'package:fforward_adm/controller/technologies_store_controller.dart';
import 'package:fforward_adm/models/technology.dart';
import 'package:get/get.dart';

class TechnologyListController extends GetxController {
  final TechnologiesStoreController _technologiesStoreController;

  TechnologyListController({technologiesStoreController})
      : _technologiesStoreController = technologiesStoreController;

  List<Technology> get technologyTable =>
      _technologiesStoreController.technologiesList;
}
