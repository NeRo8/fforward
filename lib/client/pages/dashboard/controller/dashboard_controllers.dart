import 'package:fforward_adm/services/fb_review_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final FBReviewService _reviewService;
  final String? _currentUserId;

  DashboardController({reviewService, currentUserId})
      : _reviewService = reviewService,
        _currentUserId = currentUserId;

  Query get personalReviewQuery => _reviewService.table
      .orderByChild("specialist/id")
      .equalTo(_currentUserId);

  Query get reviewsAsReviewerQuery =>
      _reviewService.table.orderByChild("reviewers/$_currentUserId");
}
