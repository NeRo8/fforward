import 'package:fforward_adm/constants/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'models.dart';

class Review {
  final String? id;
  final DateTime dateStart;
  final DateTime dateEnd;
  final ListItem specialist;
  final List<ListItem> reviewers;
  final List<ListItem> technologies;
  final ListItem? status;

  Review({
    this.id,
    required this.dateStart,
    required this.dateEnd,
    required this.specialist,
    required this.reviewers,
    required this.technologies,
    this.status,
  });

  Review.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        dateStart = DateTime.parse(json['date_start']),
        dateEnd = DateTime.parse(json['date_end']),
        specialist = ListItem.fromJson(json['specialist']),
        reviewers = json['reviewers']
            .values
            .map<ListItem>((e) => ListItem.fromJson(e))
            .toList(),
        technologies = json['technologies']
            .values
            .map<ListItem>((e) => ListItem.fromJson(e))
            .toList(),
        status = ListItem.fromJson(json['status']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'date_start': dateStart.toString(),
        'date_end': dateEnd.toString(),
        'specialist': specialist.toJson(),
        'reviewers': {for (var e in reviewers) e.id: e.toJson()},
        'technologies': {for (var e in technologies) e.id: e.toJson()},
        'status': status?.toJson(),
      };

  String formatDate(DateTime value) => DateFormat.yMMMd().format(value);

  String get getStartDateLabel => formatDate(dateStart);

  String get getEndDateLabel => formatDate(dateEnd);

  String getStatusLabel(String value) =>
      reviewStatus.firstWhereOrNull((element) => element.id == value)?.title ??
      "";

  String get getReviewersLabel => reviewers.fold<String>(
      '',
      (previousValue, currentValue) =>
          "$previousValue${previousValue.isNotEmpty ? ', ' : ''}${currentValue.title}");

  String get getTechnologiesLabel => technologies.fold<String>(
      '',
      (previousValue, currentValue) =>
          "$previousValue${previousValue.isNotEmpty ? ', ' : ''}${currentValue.title}");
}
