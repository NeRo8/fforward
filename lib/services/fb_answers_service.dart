import 'package:fforward_adm/models/answer.dart';
import 'package:firebase_database/firebase_database.dart';

class FBReviewAnswersService {
  static const tableName = 'answers_table';

  final FirebaseDatabase _fbDB;

  const FBReviewAnswersService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref(tableName);

  Future<void> createReviewAnswers(
      {required String reviewId, required Map<String, Answer> answers}) async {
    DatabaseReference recordRef = _fbDB.ref('${tableName}/${reviewId}');

    recordRef.set({
      for (var answer in answers.values) answer.questionId: answer.toJson()
    });
  }

  Query getReviewAnswersByReviewId(String reviewId) =>
      _fbDB.ref('${tableName}/${reviewId}');
}
