import 'package:flutter/material.dart';

class ListItem {
  final String id;
  final String title;

  const ListItem({required this.id, required this.title});

  ListItem.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}

class Url {
  final String url;
  final String title;

  const Url({required this.url, required this.title});

  Url.fromJson(Map<dynamic, dynamic> json)
      : url = json['url'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'url': url,
        'title': title,
      };
}

class ReviewStatus extends ListItem {
  final Color color;

  const ReviewStatus({
    required super.id,
    required super.title,
    required this.color,
  });
}

class Level {
  final String id;
  final String title;
  final Color color;

  const Level({
    required this.id,
    required this.title,
    required this.color,
  });
}

class Answer {
  final String questionId;
  final String question;
  final String answerId;

  const Answer({
    required this.questionId,
    required this.question,
    required this.answerId,
  });

  Answer.fromJson(Map<dynamic, dynamic> json)
      : questionId = json['questionId'],
        question = json['question'],
        answerId = json['answerId'];

  Map<String, dynamic> toJson() => {
        'questionId': questionId,
        'question': question,
        'answerId': answerId,
      };
}
