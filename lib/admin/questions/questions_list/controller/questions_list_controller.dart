import 'package:fforward_adm/services/fb_question_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class QuestionListController extends GetxController {
  final FBQuestionService _questionService;

  final GlobalKey<FormState> questionKey = GlobalKey<FormState>();

  QuestionListController({questionService})
      : _questionService = questionService;

  DatabaseReference get questionTable => _questionService.table;
}
