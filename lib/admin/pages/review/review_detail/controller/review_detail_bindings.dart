import 'package:fforward_adm/services/fb_review_service.dart';
import 'package:fforward_adm/services/fb_technology_service.dart';
import 'package:fforward_adm/services/fb_users_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import 'review_detail_controller.dart';

class ReviewDetailBindings extends Bindings {
  @override
  void dependencies() {
    final FirebaseDatabase fbDB = FirebaseDatabase.instance;

    final FBReviewService reviewService = FBReviewService(fbDB: fbDB);
    final FBTechnologyService technologyService =
        FBTechnologyService(fbDB: fbDB);
    final FBUsersService usersService = FBUsersService(fbDB: fbDB);

    Get.lazyPut(
      () => ReviewDetailController(
        reviewService: reviewService,
        technologyService: technologyService,
        usersService: usersService,
      ),
    );
  }
}
