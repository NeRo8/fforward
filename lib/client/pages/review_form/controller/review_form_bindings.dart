import 'package:fforward_adm/client/pages/review_form/controller/review_form_controller.dart';
import 'package:fforward_adm/client/pages/review_form/view/review_form_args.dart';
import 'package:fforward_adm/services/fb_answers_service.dart';
import 'package:fforward_adm/services/fb_question_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ReviewFormBindings extends Bindings {
  @override
  void dependencies() {
    final ReviewFormArgs args = Get.arguments;
    final FirebaseDatabase fbDB = FirebaseDatabase.instance;

    final FBQuestionService questionService = FBQuestionService(
      fbDB: fbDB,
    );
    final FBReviewAnswersService reviewAnswersService =
        FBReviewAnswersService(fbDB: fbDB);

    Get.lazyPut(
      () => ReviewFormController(
        review: args.review,
        questionService: questionService,
        reviewAnswersService: reviewAnswersService,
      ),
    );
  }
}
