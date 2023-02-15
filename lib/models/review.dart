import 'dart:convert';

class Review {
  final String? id;
  final String dateStart;
  final String dateEnd;
  final String developerId;
  final List<String> reviewers;
  final List<String> technologies;
  final String? status;

  Review({
    this.id,
    required this.dateStart,
    required this.dateEnd,
    required this.developerId,
    required this.reviewers,
    required this.technologies,
    this.status,
  });

  Review.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        dateStart = json['date_start'],
        dateEnd = json['date_end'],
        developerId = json['developer_id'],
        reviewers = json['reviewers'],
        technologies = json['technologies'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'date_start': dateStart,
        'date_end': dateEnd,
        'developer_id': developerId,
        'reviewers': json.encode(reviewers),
        'technologies': json.encode(technologies),
        'status': status
      };
}
