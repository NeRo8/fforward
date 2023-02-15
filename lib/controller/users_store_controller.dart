import 'dart:convert';

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

  String getFullname(String? id) {
    if (id == null) return '';

    final user = usersStore.value[id];

    if (user != null) {
      return "${user.firstname} ${user.lastname}";
    }

    return '';
  }

  String getFullnameFromUser(Users user) {
    return "${user.firstname} ${user.lastname}";
  }

  String getReviewersName(String ids) {
    final List<dynamic> users = json.decode(ids);

    return users.fold<String>('', (previousValue, userId) {
      final value = usersStore.value[userId];
      if (value != null) {
        return "$previousValue${previousValue.isNotEmpty ? ', ' : ''}${getFullnameFromUser(value)}";
      }
      return previousValue;
    });
  }
}
