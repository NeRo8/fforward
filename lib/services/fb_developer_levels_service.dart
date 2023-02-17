import 'package:fforward_adm/models/developer_level.dart';

import 'package:firebase_database/firebase_database.dart';

class FBDeveloperLevelsService {
  static const tableName = 'developer_levels_table';

  final FirebaseDatabase _fbDB;

  const FBDeveloperLevelsService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref(tableName);

  Future<void> createDeveloperLevel({required String title}) async {
    DatabaseReference recordRef = table.push();

    recordRef.set(
      DeveloperLevel(
        id: recordRef.key ?? title.toLowerCase(),
        title: title,
      ).toJson(),
    );
  }

  Future<void> updateDeveloperLevelById(DeveloperLevel developerLevel) async {}

  Future<void> deleteDeveloperLevelById(String id) async {}

  //Future<DataSnapshot> getDeveloperLevelById(String id) async {}
}
