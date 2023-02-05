import 'package:fforward_adm/models/users.dart';
import 'package:firebase_database/firebase_database.dart';

class FBUsersService {
  final FirebaseDatabase _fbDB;

  final DatabaseReference _table;

  const FBUsersService({fbDB, table})
      : _fbDB = fbDB,
        _table = table;

  DatabaseReference get table => _table;

  Future<void> create(Users user) async {
    _fbDB.ref('users/${user.uid}').set(user);
  }

  Future<void> updateUserById(Users user) async {}

  Future<void> deleteUserById(String uid) async {}

  Future<DataSnapshot> getUserById(String id) async =>
      _fbDB.ref('users/${id}').get();
}
