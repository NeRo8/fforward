import 'package:fforward_adm/models/developer_level.dart';

import 'package:firebase_database/firebase_database.dart';

class FBDeveloperLevelsService {
  static const tableName = 'developer_levels';

  final FirebaseDatabase _fbDB;

  const FBDeveloperLevelsService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref(tableName);

  Future<void> createDeveloperLevel(DeveloperLevel user) async {}

  Future<void> updateDeveloperLevelById(DeveloperLevel user) async {}

  Future<void> deleteDeveloperLevelById(String id) async {}

  //Future<DataSnapshot> getDeveloperLevelById(String id) async {}
}
