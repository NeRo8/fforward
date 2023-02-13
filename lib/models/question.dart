import 'dart:convert';

class Question {
  final String? id;
  final String title;
  final String description;
  final String technologyId;
  final String developerLevelId;
  final Map<String, dynamic>? urls;

  const Question({
    this.id,
    required this.title,
    required this.description,
    required this.technologyId,
    required this.developerLevelId,
    this.urls,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'technology_id': technologyId,
        'developer_level_id': developerLevelId,
        'urls': json.encode(urls),
      };
}
