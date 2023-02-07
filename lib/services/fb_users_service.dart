import 'package:fforward_adm/models/users.dart';
import 'package:firebase_database/firebase_database.dart';

class FBUsersService {
  final FirebaseDatabase _fbDB;

  const FBUsersService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref('users');

  Future<void> createUser(Users user) async {
    _fbDB.ref('users/${user.uid}').set(user.toJson());
  }

  Future<void> updateUserById(Users user) async {}

  Future<void> deleteUserById(String uid) async {}

  Future<DataSnapshot> getUserById(String id) async =>
      _fbDB.ref('users/${id}').get();
}
