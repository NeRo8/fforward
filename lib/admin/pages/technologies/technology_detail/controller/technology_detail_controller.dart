import 'package:fforward_adm/services/fb_technology_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TechnologyDetailController extends GetxController {
  final FBTechnologyService _technologyService;
  final String? _id;
  final String? _title;

  final TextEditingController titleController = TextEditingController();
  final GlobalKey<FormState> technologyFormKey = GlobalKey<FormState>();

  TechnologyDetailController({id, title, technologyService})
      : _technologyService = technologyService,
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
    if (technologyFormKey.currentState!.validate()) {
      try {
        if (_id != null) {
          //TODO: Update record
        } else {
          await _technologyService.createTechnology(
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
