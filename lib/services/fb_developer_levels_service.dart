import 'package:fforward_adm/models/developer_level.dart';

import 'package:firebase_database/firebase_database.dart';

class FBDeveloperLevelsService {
  static const tableName = 'developer_levels_table';

  final FirebaseDatabase _fbDB;

  const FBDeveloperLevelsService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref(tableName);

  Future<DataSnapshot> getDeveloperLevels() => table.get();

  Future<void> createDeveloperLevel({required String title}) async {
    DatabaseReference recordRef = table.push();

    recordRef.set(
        DeveloperLevel(id: recordRef.key ?? title.toLowerCase(), title: title)
            .toJson());
  }

  Future<void> updateDeveloperLevelById(
      String id, DeveloperLevel developerLevel) async {
    DatabaseReference recordRef = _fbDB.ref("$tableName/$id");

    recordRef.update(developerLevel.toJson());
  }

  Future<void> deleteDeveloperLevelById(String id) async {
    DatabaseReference recordRef = _fbDB.ref("$tableName/$id");

    recordRef.remove();
  }
}
