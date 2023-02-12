import 'package:firebase_database/firebase_database.dart';

import '../models/question.dart';

class FBQuestionService {
  static const tableName = 'question_table';

  final FirebaseDatabase _fbDB;

  const FBQuestionService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref(tableName);

  Future<void> createQuestion() async {
    DatabaseReference recordRef = table.push();
  }

  Future<void> updateQuestionById(Question question) async {}

  Future<void> deleteQuestionById(String id) async {}

  //Future<DataSnapshot> getDeveloperLevelById(String id) async {}
}
