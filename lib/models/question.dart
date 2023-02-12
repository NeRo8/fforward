class Question {
  final String? id;
  final String title;
  final String description;
  final String technologyId;
  final String developerLevelId;
  final List<String>? urls;

  const Question({
    this.id,
    required this.title,
    required this.description,
    required this.technologyId,
    required this.developerLevelId,
    this.urls,
  });
}
