import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/models/technology.dart';
import 'package:firebase_database/firebase_database.dart';

class FBTechnologyService {
  static const tableName = 'technology_table';

  final FirebaseDatabase _fbDB;

  const FBTechnologyService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref(tableName);

  Future<DataSnapshot> getTechnologies() => table.get();

  Future<void> createTechnology({required String title}) async {
    DatabaseReference recordRef = table.push();
    recordRef.set(
      ListItem(
        id: recordRef.key ?? title.toLowerCase(),
        title: title,
      ).toJson(),
    );
  }

  Future<void> updateTechnologyById(String id, Technology technology) async {
    DatabaseReference recordRef = _fbDB.ref("$tableName/$id");

    recordRef.update(technology.toJson());
  }

  Future<void> deleteTechnologyById(String id) async {
    DatabaseReference recordRef = _fbDB.ref("$tableName/$id");

    recordRef.remove();
  }
}
