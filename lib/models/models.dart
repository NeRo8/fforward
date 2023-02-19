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
    color: Colors.yellow,
  ),
  ReviewStatuses.inProgress: ReviewStatus(
      id: ReviewStatuses.inProgress,
      title: "In Progress",
      color: Colors.greenAccent),
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
