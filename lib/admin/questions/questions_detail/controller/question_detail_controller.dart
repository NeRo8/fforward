import 'package:fforward_adm/admin/questions/questions_detail/view/question_detail_args.dart';
import 'package:fforward_adm/services/fb_question_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionDetailController extends GetxController {
  final FBQuestionService _questionService;
  final QuestionDetailArgs? _args;

  final GlobalKey<FormState> questionFormKey = GlobalKey<FormState>();

  final RxString technologyId = ''.obs;
  final RxString developerLevelId = ''.obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  QuestionDetailController({
    questionService,
    args,
  })  : _questionService = questionService,
        _args = args;

  void onTapSubmit() async {
    try {
      if (questionFormKey.currentState!.validate()) {}
    } catch (e) {
      Get.snackbar("Error", "Error with creating question");
    }
  }

  void onTapTechnology(String techId) {
    technologyId.value = techId;
  }
}
