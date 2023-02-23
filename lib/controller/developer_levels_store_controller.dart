import 'package:fforward_adm/models/developer_level.dart';
import 'package:fforward_adm/services/fb_developer_levels_service.dart';

import 'package:get/get.dart';

class DeveloperLevelsStoreController extends GetxController {
  final FBDeveloperLevelsService _service;

  final Rx<Map<String, DeveloperLevel>> developerLevelsStore = Rx({});

  DeveloperLevelsStoreController({service}) : _service = service;

  @override
  void onInit() {
    super.onInit();

    _service.getDeveloperLevels().then((snapshot) {
      if (!snapshot.exists) return;

      final Map data = snapshot.value as Map;

      for (var element in data.values) {
        final value = DeveloperLevel.fromJson(element);
        developerLevelsStore.update((store) {
          store![value.id] = value;
        });
      }
    });

    _service.table.onChildAdded.listen((event) {
      if (!event.snapshot.exists) return;

      final DeveloperLevel developerLevel =
          DeveloperLevel.fromJson(event.snapshot.value);

      developerLevelsStore.update((store) {
        store![developerLevel.id] = developerLevel;
      });
    });

    _service.table.onChildRemoved.listen((event) {
      if (!event.snapshot.exists) return;

      final DeveloperLevel developerLevel =
          DeveloperLevel.fromJson(event.snapshot.value);

      developerLevelsStore.update((store) {
        store!.remove(developerLevel.id);
      });
    });
  }

  List<DeveloperLevel> get developerLevels =>
      developerLevelsStore.value.values.toList();

  DeveloperLevel? getDeveloperLevelById(String id) =>
      developerLevelsStore.value[id];
}
