import 'package:fforward_adm/models/question.dart';
import 'package:fforward_adm/models/review.dart';
import 'package:fforward_adm/services/fb_question_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ReviewFormController extends GetxController {
  final Review _review;
  final FBQuestionService _questionService;

  final RxList<Question> questions = <Question>[].obs;

  ReviewFormController({review, questionService})
      : _review = review,
        _questionService = questionService;

  Query get getReactQuestions =>
      _questionService.table.orderByChild("technology/NO5NurfeC9tMunL7hBy");
}
