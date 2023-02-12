import 'package:fforward_adm/models/developer_level.dart';
import 'package:fforward_adm/services/fb_developer_levels_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DeveloperLevelsDetailController extends GetxController {
  final FBDeveloperLevelsService _developerLevelsService;
  final String? _id;
  final String? _title;

  final TextEditingController titleController = TextEditingController();
  final GlobalKey<FormState> developerLevelFormKey = GlobalKey<FormState>();

  DeveloperLevelsDetailController({id, title, developerLevelsService})
      : _developerLevelsService = developerLevelsService,
        _id = id,
        _title = title;

  @override
  void onReady() {
    titleController.text = _title ?? '';
    super.onReady();
  }

  @override
  void onClose() {
    titleController.dispose();
    super.onClose();
  }

  void onTapSubmit() async {
    if (developerLevelFormKey.currentState!.validate()) {
      try {
        if (_id != null) {
          //TODO: Update record
        } else {
          await _developerLevelsService.createDeveloperLevel(
            title: titleController.text,
          );
        }
        Get.back();
      } on FirebaseException catch (e) {
        Get.snackbar("Error", e.message ?? "Trouble with data saving");
      }
    }
  }
}
