import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/models/review.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/question.dart';

class FBReviewService {
  static const tableName = 'review_table';

  final FirebaseDatabase _fbDB;

  const FBReviewService({fbDB}) : _fbDB = fbDB;

  DatabaseReference get table => _fbDB.ref(tableName);

  Future<void> createReview({
    required DateTime dateEnd,
    required DateTime dateStart,
    required List<ListItem> technologies,
    required List<ListItem> reviewers,
    required ListItem specialist,
    required ListItem status,
  }) async {
    DatabaseReference recordRef = table.push();

    recordRef.set(
      Review(
        id: recordRef.key,
        dateEnd: dateEnd,
        dateStart: dateStart,
        technologies: technologies,
        reviewers: reviewers,
        specialist: specialist,
        status: status,
      ).toJson(),
    );
  }

  Future<void> updateReviewById(Question question) async {}

  Future<void> deleteReviewById(String id) async {}

  //Future<DataSnapshot> getDeveloperLevelById(String id) async {}
}
