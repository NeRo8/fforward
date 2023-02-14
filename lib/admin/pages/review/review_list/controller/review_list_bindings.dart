import 'package:fforward_adm/admin/pages/review/review_list/controller/review_list_controller.dart';
import 'package:fforward_adm/services/fb_review_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ReviewListBindings extends Bindings {
  @override
  void dependencies() {
    final FirebaseDatabase fbDB = FirebaseDatabase.instance;

    final FBReviewService reviewService = FBReviewService(fbDB: fbDB);

    Get.lazyPut(
      () => ReviewListController(
        reviewService: reviewService,
      ),
    );
  }
}
