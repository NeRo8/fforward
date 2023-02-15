import 'package:fforward_adm/models/developer_level.dart';
import 'package:fforward_adm/services/fb_developer_levels_service.dart';

import 'package:get/get.dart';

class DeveloperLevelsStoreController extends GetxController {
  final FBDeveloperLevelsService _service;

  final Rx<Map<String, DeveloperLevel>> developerLevelsStore = Rx({});

  DeveloperLevelsStoreController({service}) : _service = service;

  @override
  void onReady() {
    super.onReady();
    _service.table.get().then((snapshot) {
      final Map data = snapshot.value as Map;
      for (var element in data.values) {
        final value = DeveloperLevel.fromJson(element);
        developerLevelsStore.update((store) {
          store![value.id] = value;
        });
      }
    });
  }

  List<DeveloperLevel> get developerLevels =>
      developerLevelsStore.value.entries.map((e) => e.value).toList();

  DeveloperLevel? getDeveloperLevelById(String id) =>
      developerLevelsStore.value[id];

  String getDeveloperLevelName(String? id) {
    if (id == null) return '';

    final developerLevel = developerLevelsStore.value[id];

    return developerLevel?.title ?? '';
  }
}
