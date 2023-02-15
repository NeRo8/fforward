import 'dart:convert';

import 'package:fforward_adm/models/developer_level.dart';
import 'package:fforward_adm/services/fb_developer_levels_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class DeveloperLevelsStoreBinding extends Bindings {
  @override
  void dependencies() {
    final FBDeveloperLevelsService service =
        FBDeveloperLevelsService(fbDB: FirebaseDatabase.instance);

    Get.lazyPut(
      () => DeveloperLevelsStoreController(service: service),
    );
  }
}

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

  DeveloperLevel? getDeveloperLevelById(String id) =>
      developerLevelsStore.value[id];

  String getDeveloperLevelName(String? id) {
    if (id == null) return '';

    final developerLevel = developerLevelsStore.value[id];

    return developerLevel?.title ?? '';
  }

  String getDeveloperLevelsName(String ids) {
    final List<dynamic> developerLevels = json.decode(ids);

    return developerLevels.fold<String>('', (previousValue, userId) {
      final value = developerLevelsStore.value[userId];

      if (value != null) {
        return "$previousValue${previousValue.isNotEmpty ? ', ' : ''}${value.title}";
      }
      return previousValue;
    });
  }
}
