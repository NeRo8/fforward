import 'package:fforward_adm/models/technology.dart';
import 'package:fforward_adm/services/fb_technology_service.dart';
import 'package:get/get.dart';

class TechnologyFormFieldController extends GetxController {
  final String? _selectedTechnologyId;
  final FBTechnologyService _technologyService;
  final RxBool isFieldSelected = false.obs;

  final RxList<Technology> technologies = <Technology>[].obs;

  TechnologyFormFieldController({selectedTechnologyId, technologyService})
      : _selectedTechnologyId = selectedTechnologyId,
        _technologyService = technologyService;

  @override
  void onInit() {
    super.onInit();

    _technologyService.table.get().then((data) {
      if (data.exists) {
        final Map items = (data.value as Map);

        items.forEach((key, value) {
          technologies.add(Technology.fromJson(value));
        });
      }
    });
  }

  void onChangeTechnologyListVisible(bool visible) =>
      isFieldSelected.value = visible;
}
