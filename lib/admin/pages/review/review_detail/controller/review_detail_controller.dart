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
  final RxList<ListItem> statuses = <ListItem>[
    const ListItem(id: "0", title: "Pending"),
    const ListItem(id: "1", title: "In Progress"),
    const ListItem(id: "2", title: "Complete"),
  ].obs;
  //
  final TextEditingController startDateController = TextEditingController();
  final Rx<DateTime?> startDate = Rx(null);
  final TextEditingController endDateController = TextEditingController();
  final Rx<DateTime?> endDate = Rx(null);

  final RxList<String> technologiesId = <String>[].obs;
  final RxString developerId = ''.obs;
  final RxList<String> reviewersId = <String>[].obs;
  final RxString status = '0'.obs;

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

  void onTapReviewers(String id) {
    final isUserSelected =
        reviewersId.firstWhereOrNull((element) => element == id);
    if (isUserSelected == null) {
      reviewersId.add(id);
    } else {
      reviewersId.removeWhere((element) => element == id);
    }
  }

  String get technologiesLabel {
    return technologiesId.fold<String>('', (value, currentTechnologyId) {
      final technology = technologies
          .firstWhereOrNull((tech) => tech.id == currentTechnologyId);
      if (technology != null) {
        return "$value${value.isNotEmpty ? ', ' : ''}${technology.title}";
      }

      return value;
    });
  }

  void onTapTechnology(String id) {
    final isTechnologySelected =
        technologiesId.firstWhereOrNull((element) => element == id);
    if (isTechnologySelected == null) {
      technologiesId.add(id);
    } else {
      technologiesId.removeWhere((element) => element == id);
    }
  }

  String get statusLabel =>
      statuses.firstWhereOrNull((i) => i.id == status.value)?.title ?? "";

  void onTapStatus(String value) => status.value = value;

  void onTapSubmit() async {
    try {
      if (reviewForm.currentState!.validate()) {
        // _reviewService.createReview(
        //   endDate.toString(),
        //   startDate.toString(),
        //   technologiesId,
        //   reviewersId,
        //   developerId.value,
        //   status.value,
        // );
      }
    } catch (e) {
      print(e);
    }
  }
}
