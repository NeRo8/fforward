import 'package:fforward_adm/admin/questions/questions_detail/view/question_detail_args.dart';
import 'package:fforward_adm/services/fb_question_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import 'question_detail_controller.dart';

class QuestionDetailBindings extends Bindings {
  @override
  void dependencies() {
    final QuestionDetailArgs? args = Get.arguments;

    final FBQuestionService questionService =
        FBQuestionService(fbDB: FirebaseDatabase.instance);

    Get.lazyPut(
      () => QuestionDetailController(
        questionService: questionService,
        args: args,
      ),
    );
  }
}
