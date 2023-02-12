import 'package:fforward_adm/models/technology.dart';
import 'package:firebase_database/firebase_database.dart';

class FBTechnologyService {
  static const tableName = 'technology_table';

  final FirebaseDatabase _fbDB;

  const FBTechnologyService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref(tableName);

  Future<void> createTechnology({required String title}) async {
    DatabaseReference recordRef = table.push();
    recordRef.set({'id': recordRef.key, 'title': title});
  }

  Future<void> updateTechnologyById(Technology technology) async {}

  Future<void> deleteTechnologyById(String id) async {}

  //Future<DataSnapshot> getDeveloperLevelById(String id) async {}
}
