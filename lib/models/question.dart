import 'package:fforward_adm/models/developer_level.dart';
import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/models/technology.dart';

class Question {
  final String? id;
  final String title;
  final String description;
  final Technology technology;
  final DeveloperLevel developerLevel;
  final Map<String, Url>? urls;

  const Question({
    this.id,
    required this.title,
    required this.description,
    required this.technology,
    required this.developerLevel,
    this.urls,
  });

  List<Url>? get getUrls => urls?.values.toList() ?? [];

  Question.fromJson(Map<dynamic, dynamic> j)
      : id = j['id'],
        title = j['title'],
        description = j['description'],
        technology = Technology.fromJson(j['technology']),
        developerLevel = DeveloperLevel.fromJson(j['developer_level']),
        urls = j['urls'] != null
            ? {for (var e in j['urls'].entries) e.key: Url.fromJson(e.value)}
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'technology': technology.toJson(),
        'developer_level': developerLevel.toJson(),
        'urls': (urls != null)
            ? {for (var e in urls!.entries) e.key: e.value.toJson()}
            : null
      };
}
