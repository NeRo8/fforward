import 'package:fforward_adm/admin/questions/questions_list/controller/questions_list_controller.dart';
import 'package:fforward_adm/services/fb_question_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class QuestionsListBindings extends Bindings {
  @override
  void dependencies() {
    final FBQuestionService questionService =
        FBQuestionService(fbDB: FirebaseDatabase.instance);

    Get.lazyPut(() => QuestionListController(questionService: questionService));
  }
}
