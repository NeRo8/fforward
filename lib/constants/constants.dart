import 'package:fforward_adm/models/models.dart';
import 'package:flutter/material.dart';

class ReviewStatuses {
  static const pending = 'pending';
  static const missed = 'missed';
  static const complete = 'completed';
  static const inProgress = 'in_progress';
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
