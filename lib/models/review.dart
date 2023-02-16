import 'dart:convert';

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
        specialist = ListItem.fromJson(jsonDecode(json['specialist'])),
        reviewers = (jsonDecode(json['reviewers']) as List<dynamic>)
            .map<ListItem>((item) => ListItem.fromJson(item))
            .toList(),
        technologies = (jsonDecode(json['technologies']) as List<dynamic>)
            .map<ListItem>((item) => ListItem.fromJson(item))
            .toList(),
        status = ListItem.fromJson(jsonDecode(json['status']));

  Map<String, dynamic> toJson() => {
        'id': id,
        'date_start': dateStart.toString(),
        'date_end': dateEnd.toString(),
        'specialist': json.encode(specialist),
        'reviewers': json.encode(reviewers),
        'technologies': json.encode(technologies),
        'status': json.encode(status)
      };

  String get getReviewers => reviewers.fold<String>(
      '',
      (previousValue, currentValue) =>
          "$previousValue${previousValue.isNotEmpty ? ', ' : ''}${currentValue.title}");

  String get getTechnologies => technologies.fold<String>(
      '',
      (previousValue, currentValue) =>
          "$previousValue${previousValue.isNotEmpty ? ', ' : ''}${currentValue.title}");
}
