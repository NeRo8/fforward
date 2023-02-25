import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/models/users.dart';
import 'package:fforward_adm/services/fb_users_service.dart';

import 'package:get/get.dart';

class UsersStoreController extends GetxController {
  final FBUsersService _service;

  final Rx<Map<String, Users>> usersStore = Rx({});

  UsersStoreController({required FBUsersService service}) : _service = service;

  @override
  void onInit() {
    super.onInit();

    _service.getUsersTable().then((snapshot) {
      if (!snapshot.exists) return;

      final Map data = snapshot.value as Map;

      for (var element in data.values) {
        final value = Users.fromJson(element);

        usersStore.update((store) {
          store![value.uid] = value;
        });
      }
    });
  }

  Users? getUserById(String id) => usersStore.value[id];

  List<ListItem> get specialistsList => usersStore.value.values
      .map((e) => ListItem(id: e.uid, title: "${e.firstname} ${e.lastname}"))
      .toList();

  List<Users> get usersList => usersStore.value.values.toList();
}
