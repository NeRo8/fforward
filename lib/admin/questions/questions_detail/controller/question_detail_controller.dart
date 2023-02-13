import 'package:fforward_adm/admin/questions/questions_detail/view/question_detail_args.dart';
import 'package:fforward_adm/models/developer_level.dart';
import 'package:fforward_adm/models/technology.dart';
import 'package:fforward_adm/services/fb_developer_levels_service.dart';
import 'package:fforward_adm/services/fb_question_service.dart';
import 'package:fforward_adm/services/fb_technology_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionDetailController extends GetxController {
  final FBQuestionService _questionService;
  final FBTechnologyService _technologyService;
  final FBDeveloperLevelsService _developerLevelsService;
  final QuestionDetailArgs? _args;

  //collection data
  final RxList<Technology> technologies = <Technology>[].obs;
  final RxList<DeveloperLevel> developerLevels = <DeveloperLevel>[].obs;
  //Form fields
  final GlobalKey<FormState> questionFormKey = GlobalKey<FormState>();
  final RxString technologyId = ''.obs;
  final RxString developerLevelId = ''.obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  QuestionDetailController({
    questionService,
    technologyService,
    developerLevelsService,
    args,
  })  : _questionService = questionService,
        _technologyService = technologyService,
        _developerLevelsService = developerLevelsService,
        _args = args;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _technologyService.table.get().then((snapshot) {
      final Map data = snapshot.value as Map;

      for (var technology in data.values) {
        technologies.add(Technology.fromJson(technology));
      }
    });

    _developerLevelsService.table.get().then((snapshot) {
      final Map data = snapshot.value as Map;

      for (var developerLevel in data.values) {
        developerLevels.add(DeveloperLevel.fromJson(developerLevel));
      }
    });
  }

  String get technologyLabel =>
      technologies
          .firstWhereOrNull((tech) => tech.id == technologyId.value)
          ?.title ??
      "";

  void onTapTechnology(String techId) {
    technologyId.value = techId;
  }

  String get developerLevelLabel =>
      developerLevels
          .firstWhereOrNull((tech) => tech.id == developerLevelId.value)
          ?.title ??
      "";

  void onTapDeveloperLevel(String devLevId) {
    developerLevelId.value = devLevId;
  }

  void onTapSubmit() async {
    try {
      if (questionFormKey.currentState!.validate()) {}
    } catch (e) {
      Get.snackbar("Error", "Error with creating question");
    }
  }
}
