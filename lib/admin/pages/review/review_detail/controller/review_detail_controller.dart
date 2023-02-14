import 'package:fforward_adm/models/developer_level.dart';
import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/models/technology.dart';
import 'package:fforward_adm/services/fb_review_service.dart';
import 'package:fforward_adm/services/fb_technology_service.dart';
import 'package:fforward_adm/services/fb_users_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReviewDetailController extends GetxController {
  final FBReviewService _reviewService;
  final FBTechnologyService _technologyService;
  final FBUsersService _usersService;

  final GlobalKey<FormState> reviewForm = GlobalKey<FormState>();

  //collection data
  final RxList<Technology> technologies = <Technology>[].obs;
  final RxList<DeveloperLevel> developerLevels = <DeveloperLevel>[].obs;
  final RxList<ListItem> users = <ListItem>[].obs;
  //
  final TextEditingController startDateController = TextEditingController();
  final Rx<DateTime?> startDate = Rx(null);
  final TextEditingController endDateController = TextEditingController();
  final Rx<DateTime?> endDate = Rx(null);

  final RxString technologyId = ''.obs;
  final RxString developerId = ''.obs;

  ReviewDetailController({
    reviewService,
    technologyService,
    usersService,
  })  : _reviewService = reviewService,
        _technologyService = technologyService,
        _usersService = usersService;

  @override
  void onInit() {
    _technologyService.table.get().then((snapshot) {
      final Map data = snapshot.value as Map;

      for (var technology in data.values) {
        technologies.add(Technology.fromJson(technology));
      }
    });

    _usersService.table.get().then((snapshot) {
      final Map data = snapshot.value as Map;

      for (var user in data.values) {
        users.add(
          ListItem(
              id: user['uid'],
              title: user['firstname'] + " " + user['lastname']),
        );
      }
    });

    super.onInit();
  }

  String get technologyLabel =>
      technologies
          .firstWhereOrNull((tech) => tech.id == technologyId.value)
          ?.title ??
      "";

  void onTapTechnology(String id) {
    technologyId.value = id;
  }

  String get userLabel =>
      users.firstWhereOrNull((i) => i.id == developerId.value)?.title ?? "";

  void onTapUser(String id) {
    developerId.value = id;
  }

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

  void onTapSubmit() async {}
}
