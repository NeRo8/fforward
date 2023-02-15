import 'package:fforward_adm/admin/pages/questions/questions_detail/view/question_detail_args.dart';
import 'package:fforward_adm/controller/developer_levels_store_controller.dart';
import 'package:fforward_adm/controller/technologies_store_controller.dart';
import 'package:fforward_adm/services/fb_question_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import 'question_detail_controller.dart';

class QuestionDetailBindings extends Bindings {
  @override
  void dependencies() {
    final QuestionDetailArgs? args = Get.arguments;
    final FirebaseDatabase fbDB = FirebaseDatabase.instance;

    final FBQuestionService questionService = FBQuestionService(fbDB: fbDB);

    final DeveloperLevelsStoreController developerLevelsStoreController =
        Get.find<DeveloperLevelsStoreController>();
    final TechnologiesStoreController technologiesStoreController =
        Get.find<TechnologiesStoreController>();

    Get.lazyPut(
      () => QuestionDetailController(
        questionService: questionService,
        technologiesStoreController: technologiesStoreController,
        developerLevelsStoreController: developerLevelsStoreController,
        args: args,
      ),
    );
  }
}
