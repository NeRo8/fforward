import 'package:fforward_adm/models/answer.dart';
import 'package:fforward_adm/models/question.dart';
import 'package:fforward_adm/models/review.dart';
import 'package:fforward_adm/services/fb_answers_service.dart';
import 'package:fforward_adm/services/fb_question_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ReviewFormController extends GetxController {
  final Review _review;
  final FBQuestionService _questionService;
  final FBReviewAnswersService _reviewAnswersService;

  final RxMap<String, Question> _questions = RxMap({});

  final RxMap<String, Answer> answers = RxMap({});

  ReviewFormController({review, questionService, reviewAnswersService})
      : _review = review,
        _questionService = questionService,
        _reviewAnswersService = reviewAnswersService;

  @override
  void onReady() {
    super.onReady();

    for (var element in _review.technologies) {
      _questionService.table
          .orderByChild("technology/id")
          .equalTo(element.id)
          .once(DatabaseEventType.value)
          .then((response) {
        if (response.snapshot.value == null) return;
        final Map data = response.snapshot.value as Map;

        data.forEach((key, value) {
          _questions[key] = Question.fromJson(value);
        });
      });
    }

    _reviewAnswersService
        .getReviewAnswersByReviewId(_review.id!)
        .get()
        .then((snapshot) {
      final Map response = snapshot.value as Map;

      response.forEach((key, value) {
        answers[key] = Answer.fromJson(value);
      });
    });
  }

  List<Question> get questions {
    List<Question> list = _questions.values.toList();
    list.sort((a, b) {
      int techCompare = a.technology.title.compareTo(b.technology.title);
      if (techCompare != 0) {
        return techCompare;
      } else {
        return a.developerLevel.title.compareTo(b.developerLevel.title);
      }
    });
    return list;
  }

  void onTapAnswers({
    required String questionId,
    required String answerId,
  }) {
    final question = _questions[questionId];

    if (question == null) return;

    answers[questionId] = Answer(
      questionId: questionId,
      question: question.title,
      answerId: answerId,
    );
  }

  void onTapSubmit() {
    if (_review.id != null) {
      _reviewAnswersService.createReviewAnswers(
        reviewId: _review.id!,
        answers: answers,
      );
    }
  }
}
