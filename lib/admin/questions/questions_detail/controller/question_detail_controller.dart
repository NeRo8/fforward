import 'package:fforward_adm/admin/questions/questions_detail/view/question_detail_args.dart';
import 'package:fforward_adm/services/fb_question_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionDetailController extends GetxController {
  final FBQuestionService _questionService;

  final QuestionDetailArgs? _args;

  final GlobalKey<FormState> questionFormKey = GlobalKey<FormState>();
  final TextEditingController technologyId = TextEditingController();

  QuestionDetailController({
    questionService,
    args,
  })  : _questionService = questionService,
        _args = args;

  void onTapSubmit() async {
    try {
      if (questionFormKey.currentState!.validate()) {}
    } catch (e) {}
  }
}
