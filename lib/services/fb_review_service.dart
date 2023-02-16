import 'package:fforward_adm/models/review.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/question.dart';

class FBReviewService {
  static const tableName = 'review_table';

  final FirebaseDatabase _fbDB;

  const FBReviewService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref(tableName);

  Future<void> createReview(
    dateEnd,
    dateStart,
    technologies,
    reviewers,
    developerId,
    status,
  ) async {
    DatabaseReference recordRef = table.push();
  }

  Future<void> updateReviewById(Question question) async {}

  Future<void> deleteReviewById(String id) async {}

  //Future<DataSnapshot> getDeveloperLevelById(String id) async {}
}
