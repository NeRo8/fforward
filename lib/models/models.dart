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

class ReviewStatuses {
  static const pending = 'pending';
  static const missed = 'missed';
  static const complete = 'completed';
  static const inProgress = 'in_progress';
}

class ReviewStatus extends ListItem {
  final Color color;

  const ReviewStatus({
    required super.id,
    required super.title,
    required this.color,
  });
}

const Map<String, ReviewStatus> reviewStatuses = {
  ReviewStatuses.pending: ReviewStatus(
    id: ReviewStatuses.pending,
    title: "Pending",
    color: Colors.orange,
  ),
  ReviewStatuses.inProgress: ReviewStatus(
    id: ReviewStatuses.inProgress,
    title: "In Progress",
    color: Colors.lightBlue,
  ),
  ReviewStatuses.complete: ReviewStatus(
    id: ReviewStatuses.complete,
    title: "Complete",
    color: Colors.green,
  ),
  ReviewStatuses.missed: ReviewStatus(
    id: ReviewStatuses.missed,
    title: "Missed",
    color: Colors.red,
  ),
};

const List<ListItem> reviewStatus = <ListItem>[
  ListItem(id: "pending", title: "Pending"),
  ListItem(id: "in_progress", title: "In Progress"),
  ListItem(id: "complete", title: "Complete"),
  ListItem(id: "missed", title: "Missed"),
];

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

const notSelectedLevel =
    Level(id: "not_selected", title: "Not selected", color: Colors.grey);

const Map<String, Level> levels = {
  "not_selected": notSelectedLevel,
  "0": Level(id: "0", title: "Without experience", color: Colors.red),
  "1": Level(id: "1", title: "Need improvement", color: Colors.blue),
  "2": Level(id: "2", title: "Good knowledge", color: Colors.green),
  "3": Level(id: "3", title: "Excellent knowledge", color: Colors.orange),
};
