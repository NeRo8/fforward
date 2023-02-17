import 'package:fforward_adm/models/developer_level.dart';
import 'package:fforward_adm/models/technology.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/models.dart';
import '../models/question.dart';

class FBQuestionService {
  static const tableName = 'question_table';

  final FirebaseDatabase _fbDB;

  const FBQuestionService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref(tableName);

  Future<void> createQuestion({
    required String title,
    required String description,
    required Technology technology,
    required DeveloperLevel developerLevel,
    Map<String, Url>? urls,
  }) async {
    DatabaseReference recordRef = table.push();

    recordRef.set(
      Question(
        id: recordRef.key,
        title: title,
        description: description,
        technology: technology,
        developerLevel: developerLevel,
        urls: urls,
      ).toJson(),
    );
  }

  Future<void> updateQuestionById(Question question) async {}

  Future<void> deleteQuestionById(String id) async {}

  //Future<DataSnapshot> getDeveloperLevelById(String id) async {}
}
