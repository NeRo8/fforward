import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

void onTapLink(String itemUrl) async {
  final Uri url = Uri.parse(itemUrl);
  final canLaunch = await canLaunchUrl(url);

  if (canLaunch) {
    await launchUrl(url);
  } else {
    Get.snackbar(
      "Error",
      "Urls in no longer valid",
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}
