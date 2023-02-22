import 'package:fforward_adm/models/models.dart';
import 'package:get/get.dart';

import '../resources/app_strings.dart';

String? isEmptyValidation(String? value, {String? message}) =>
    (value == null || value.isEmpty) ? AppStrings.requiredField : null;

String? isListContainValidation(List<ListItem>? list, ListItem? value) {
  if (list == null || list.isEmpty) return AppStrings.requiredField;

  final isContain = list.firstWhereOrNull((item) => item.id == value?.id);

  if (isContain != null) {
    return "Specialist can't make self review";
  }

  return null;
}
