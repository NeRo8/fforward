import 'package:fforward_adm/models/users.dart';
import 'package:firebase_database/firebase_database.dart';

class FBUsersService {
  static const tableName = 'users_table';
  final FirebaseDatabase _fbDB;

  const FBUsersService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref(tableName);

  Future<void> createUser({
    required String uid,
    required String lastname,
    required String firstname,
    required String email,
    required String permission,
  }) async {
    final DatabaseReference userRef = _fbDB.ref("${tableName}/${uid}");

    userRef.set(
      Users(
        uid: uid,
        firstname: firstname,
        lastname: lastname,
        email: email,
        permission: permission,
      ).toJson(),
    );
  }

  Future<void> updateUserById(Users user) async {}

  Future<void> deleteUserById(String uid) async {}

  Future<DataSnapshot> getUserById(String id) async =>
      _fbDB.ref("${tableName}/${id}").get();
}
