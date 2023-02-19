import 'package:fforward_adm/controller/current_user_controller.dart';
import 'package:fforward_adm/services/fb_review_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import 'package:fforward_adm/client/pages/dashboard/controller/dashboard_controllers.dart';

import 'package:fforward_adm/controller/developer_levels_store_controller.dart';
import 'package:fforward_adm/controller/technologies_store_controller.dart';
import 'package:fforward_adm/controller/users_store_controller.dart';

import 'package:fforward_adm/services/fb_developer_levels_service.dart';
import 'package:fforward_adm/services/fb_technology_service.dart';
import 'package:fforward_adm/services/fb_users_service.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    final FirebaseDatabase fbDB = FirebaseDatabase.instance;

    final FBUsersService usersService = FBUsersService(fbDB: fbDB);
    final FBTechnologyService technologyService =
        FBTechnologyService(fbDB: fbDB);
    final FBDeveloperLevelsService developerLevelsService =
        FBDeveloperLevelsService(fbDB: fbDB);
    final FBReviewService reviewService = FBReviewService(fbDB: fbDB);

    Get.put(UsersStoreController(service: usersService));
    Get.put(TechnologiesStoreController(service: technologyService));
    Get.put(DeveloperLevelsStoreController(service: developerLevelsService));
    Get.lazyPut(
      () => DashboardController(
        reviewService: reviewService,
        currentUserId: FirebaseAuth.instance.currentUser?.uid,
      ),
    );
  }
}
