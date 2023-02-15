import 'dart:convert';

import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/models/users.dart';
import 'package:fforward_adm/services/fb_users_service.dart';

import 'package:get/get.dart';

class UsersStoreController extends GetxController {
  final FBUsersService _service;

  final Rx<Map<String, Users>> usersStore = Rx({});

  UsersStoreController({service}) : _service = service;

  @override
  void onReady() {
    super.onReady();

    _service.table.get().then((snapshot) {
      final Map data = snapshot.value as Map;

      for (var value in data.values) {
        final u = Users.fromJson(value);
        usersStore.update((store) {
          store![u.uid] = u;
        });
      }
    });
  }

  Users? getUserById(String id) => usersStore.value[id];

  List<ListItem> get specialists => usersStore.value.entries
      .map((e) => ListItem(
          id: e.value.uid, title: "${e.value.firstname} ${e.value.lastname}"))
      .toList();

  String getReviewersName(String ids) {
    final List<dynamic> users = json.decode(ids);

    return users.fold<String>('', (previousValue, userId) {
      final value = usersStore.value[userId];
      if (value != null) {
        return "$previousValue${previousValue.isNotEmpty ? ', ' : ''}${value.fullname}";
      }
      return previousValue;
    });
  }
}
