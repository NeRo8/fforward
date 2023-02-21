import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonSnackBar {
  const CommonSnackBar();

  GetSnackBar callSnackBar(String title, String message) => GetSnackBar(
        title: title,
        message: message,
        margin: const EdgeInsets.all(16),
        snackPosition: SnackPosition.BOTTOM,
        duration: 1.seconds,
      );

  void callSuccessSnackBar() =>
      Get.showSnackbar(callSnackBar("Success", "Record successful created"));

  void callErrorSnackBar() =>
      Get.showSnackbar(callSnackBar("Error", "Trouble with creating record"))
          .close();
}

const CommonSnackBar commonSnackBar = CommonSnackBar();
