import 'dart:convert';

import 'package:fforward_adm/models/technology.dart';
import 'package:fforward_adm/services/fb_technology_service.dart';
import 'package:get/get.dart';

class TechnologiesStoreController extends GetxController {
  final FBTechnologyService _service;

  final Rx<Map<String, Technology>> technologyStore = Rx({});

  TechnologiesStoreController({service}) : _service = service;

  @override
  void onReady() {
    super.onReady();

    _service.table.get().then((snapshot) {
      final Map data = snapshot.value as Map;
      for (var element in data.values) {
        final value = Technology.fromJson(element);
        technologyStore.update((store) {
          store![value.id] = value;
        });
      }
    });
  }

  Technology? getTechnologyById(String id) => technologyStore.value[id];

  List<Technology> get technologies =>
      technologyStore.value.entries.map((e) => e.value).toList();

  String getTechnologyName(String? id) {
    if (id == null) return '';

    final technology = technologyStore.value[id];

    return technology?.title ?? '';
  }

  String getTechnologiesName(String ids) {
    final List<dynamic> technologies = json.decode(ids);

    return technologies.fold<String>('', (previousValue, userId) {
      final value = technologyStore.value[userId];

      if (value != null) {
        return "$previousValue${previousValue.isNotEmpty ? ', ' : ''}${value.title}";
      }
      return previousValue;
    });
  }
}
