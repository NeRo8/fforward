import 'package:fforward_adm/models/users.dart';
import 'package:firebase_database/firebase_database.dart';

class FBUsersService {
  static const tableName = 'users_table';
  final FirebaseDatabase _fbDB;

  const FBUsersService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref(tableName);

  Future<void> createUser(Users user) async {
    _fbDB.ref("${tableName}/${user.uid}").set(user.toJson());
  }

  Future<void> updateUserById(Users user) async {}

  Future<void> deleteUserById(String uid) async {}

  Future<DataSnapshot> getUserById(String id) async =>
      _fbDB.ref("${tableName}/${id}").get();
}
