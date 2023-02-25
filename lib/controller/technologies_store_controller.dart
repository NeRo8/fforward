import 'package:fforward_adm/models/technology.dart';
import 'package:fforward_adm/services/fb_technology_service.dart';
import 'package:get/get.dart';

class TechnologiesStoreController extends GetxController {
  final FBTechnologyService _service;

  final Rx<Map<String, Technology>> technologyStore = Rx({});

  TechnologiesStoreController({service}) : _service = service;

  @override
  void onInit() {
    super.onInit();

    _service.getTechnologies().then((snapshot) {
      if (!snapshot.exists) return;

      final Map data = snapshot.value as Map;

      for (var element in data.values) {
        final value = Technology.fromJson(element);
        technologyStore.update((store) {
          store![value.id] = value;
        });
      }
    });

    _service.table.onChildAdded.listen((event) {
      if (!event.snapshot.exists) return;

      final Technology technology = Technology.fromJson(event.snapshot.value);

      technologyStore.update((store) {
        store![technology.id] = technology;
      });
    });

    _service.table.onChildRemoved.listen((event) {
      if (!event.snapshot.exists) return;

      final Technology technology = Technology.fromJson(event.snapshot.value);

      technologyStore.update((store) {
        store!.remove(technology.id);
      });
    });
  }

  List<Technology> get technologiesList =>
      technologyStore.value.values.toList();

  Technology? getTechnologyById(String id) => technologyStore.value[id];
}
