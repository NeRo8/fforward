import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:fforward_adm/controller/technologies_store_controller.dart';
import 'package:fforward_adm/controller/users_store_controller.dart';
import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/models/technology.dart';
import 'package:fforward_adm/services/fb_review_service.dart';
import 'package:fforward_adm/utils/common_snackbar.dart';
import 'package:fforward_adm/constants/constants.dart';

class ReviewDetailController extends GetxController {
  final FBReviewService _reviewService;
  final TechnologiesStoreController _technologiesStoreController;
  final UsersStoreController _usersStoreController;

  final GlobalKey<FormState> reviewForm = GlobalKey<FormState>();

  final Rx<ListItem?> selectedStatus = Rx(reviewStatus[0]);
  final RxList<ListItem> statuses = reviewStatus.obs;

  final Rx<DateTime?> startDate = Rx(null);
  final TextEditingController startDateController = TextEditingController();

  final Rx<DateTime?> endDate = Rx(null);
  final TextEditingController endDateController = TextEditingController();

  final RxList<Technology> selectedTechnologies = <Technology>[].obs;
  List<Technology> get technologies =>
      _technologiesStoreController.technologies;

  final Rx<ListItem?> selectedSpecialist = Rx(null);

  final RxList<ListItem> selectedReviewers = <ListItem>[].obs;
  List<ListItem> get specialists => _usersStoreController.specialists;

  ReviewDetailController({
    reviewService,
    technologiesStoreController,
    usersStoreController,
  })  : _reviewService = reviewService,
        _technologiesStoreController = technologiesStoreController,
        _usersStoreController = usersStoreController;

  @override
  onClose() {
    startDateController.dispose();
    endDateController.dispose();

    super.onClose();
  }

  List<ListItem> get getSelectedReviewers => selectedReviewers;

  void onTapStartDate(DateTime? value) {
    startDate.value = value;
    startDateController.text =
        value != null ? DateFormat.yMMMMd().format(value) : '';

    endDate.value = null;
    endDateController.text = '';
  }

  void onTapEndDate(DateTime? value) {
    endDate.value = value;
    endDateController.text =
        value != null ? DateFormat.yMMMMd().format(value) : '';
  }

  void onTapSpecialist(ListItem value) => selectedSpecialist.value = value;

  void onTapReviewers(ListItem value) {
    final isUserSelected =
        selectedReviewers.firstWhereOrNull((element) => element.id == value.id);

    if (isUserSelected == null) {
      selectedReviewers.add(value);
    } else {
      selectedReviewers.removeWhere((element) => element.id == value.id);
    }
  }

  void onTapTechnology(Technology value) {
    final isTechnologySelected = selectedTechnologies
        .firstWhereOrNull((element) => element.id == value.id);
    if (isTechnologySelected == null) {
      selectedTechnologies.add(value);
    } else {
      selectedTechnologies.removeWhere((element) => element.id == value.id);
    }
  }

  void onTapStatus(ListItem value) => selectedStatus.value = value;

  void onTapSubmit({bool withContinue = false}) async {
    try {
      if (reviewForm.currentState!.validate()) {
        await _reviewService.createReview(
          dateEnd: endDate.value!,
          dateStart: startDate.value!,
          technologies: selectedTechnologies,
          reviewers: selectedReviewers,
          specialist: selectedSpecialist.value!,
          status: selectedStatus.value!,
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
