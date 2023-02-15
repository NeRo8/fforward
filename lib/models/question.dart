import 'dart:convert';

import 'package:fforward_adm/models/developer_level.dart';
import 'package:fforward_adm/models/technology.dart';

class Question {
  final String? id;
  final String title;
  final String description;
  final Technology technology;
  final DeveloperLevel developerLevel;
  final Map<String, dynamic>? urls;

  const Question({
    this.id,
    required this.title,
    required this.description,
    required this.technology,
    required this.developerLevel,
    this.urls,
  });

  Question.fromJson(Map<dynamic, dynamic> j)
      : id = j['id'],
        title = j['title'],
        description = j['description'],
        technology = Technology.fromJson(j['technology']),
        developerLevel = DeveloperLevel.fromJson(j['developer_level']),
        urls = json.decode(j['urls']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'technology': technology.toJson(),
        'developer_level': developerLevel.toJson(),
        'urls': json.encode(urls),
      };
}
