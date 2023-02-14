import 'package:fforward_adm/services/fb_review_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ReviewListController extends GetxController {
  final FBReviewService _reviewService;

  ReviewListController({reviewService}) : _reviewService = reviewService;

  DatabaseReference get reviewTable => _reviewService.table;
}
