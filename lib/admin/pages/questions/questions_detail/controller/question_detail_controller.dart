import 'dart:math';
import 'package:fforward_adm/utils/common_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fforward_adm/admin/pages/questions/questions_detail/view/question_detail_args.dart';

import 'package:fforward_adm/controller/developer_levels_store_controller.dart';
import 'package:fforward_adm/controller/technologies_store_controller.dart';

import 'package:fforward_adm/models/developer_level.dart';
import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/models/technology.dart';

import 'package:fforward_adm/services/fb_question_service.dart';

class QuestionDetailController extends GetxController {
  final FBQuestionService _questionService;
  final TechnologiesStoreController _technologiesStoreController;
  final DeveloperLevelsStoreController _developerLevelsStoreController;
  final QuestionDetailArgs? _args;

  //Form fields
  final GlobalKey<FormState> questionFormKey = GlobalKey<FormState>();

  final Rx<Technology?> technology = Rx(null);
  final Rx<DeveloperLevel?> developerLevel = Rx(null);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final RxMap<String, Url> urls = RxMap({});

  QuestionDetailController({
    questionService,
    technologiesStoreController,
    developerLevelsStoreController,
    args,
  })  : _questionService = questionService,
        _technologiesStoreController = technologiesStoreController,
        _developerLevelsStoreController = developerLevelsStoreController,
        _args = args;

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void onTapTechnology(Technology value) {
    technology.value = value;
  }

  void onTapDeveloperLevel(DeveloperLevel devLevel) {
    developerLevel.value = devLevel;
  }

  List<Technology> get technologies =>
      _technologiesStoreController.technologies;
  List<DeveloperLevel> get developerLevels =>
      _developerLevelsStoreController.developerLevels;
  List<Url> get urlsList => urls.entries.map((item) => item.value).toList();

  void onCreateUrl(String url, String title) {
    final rnd = Random();
    final urlId = rnd.nextInt(1000).toString();

    urls[urlId] = Url(url: url, title: title);
  }

  void onRemoveUrl(String uuid) => urls.remove(uuid);

  void onTapSubmit({bool withContinue = false}) async {
    try {
      if (questionFormKey.currentState!.validate()) {
        await _questionService.createQuestion(
          title: titleController.text,
          description: descriptionController.text,
          technology: technology.value!,
          developerLevel: developerLevel.value!,
          urls: urls,
        );

        if (!withContinue) {
          Get.back();
        }
        commonSnackBar.callSuccessSnackBar();
      }
    } catch (e) {
      commonSnackBar.callErrorSnackBar();
    }
  }
}
