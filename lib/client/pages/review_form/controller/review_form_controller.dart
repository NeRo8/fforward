import 'package:fforward_adm/models/question.dart';
import 'package:fforward_adm/models/review.dart';
import 'package:fforward_adm/services/fb_question_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ReviewFormController extends GetxController {
  final Review _review;
  final FBQuestionService _questionService;

  final RxMap<String, Question> _questions = RxMap({});

  final RxMap<String, String> answers = RxMap({});

  ReviewFormController({review, questionService})
      : _review = review,
        _questionService = questionService;

  @override
  void onReady() {
    super.onReady();

    for (var element in _review.technologies) {
      _questionService.table
          .orderByChild("technology/id")
          .equalTo(element.id)
          .once(DatabaseEventType.value)
          .then((response) {
        final Map data = response.snapshot.value as Map;

        data.forEach((key, value) {
          _questions[key] = Question.fromJson(value);
        });
      });
    }
  }

  List<Question> get questions => _questions.values.toList();

  void onTapAnswers({
    required String questionId,
    required String levelId,
  }) {
    answers[questionId] = levelId;
  }
}
