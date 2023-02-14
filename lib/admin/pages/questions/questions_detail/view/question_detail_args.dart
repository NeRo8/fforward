class QuestionDetailArgs {
  final String developerLevelId;
  final String technologyId;
  final String title;
  final String description;
  final List<String>? urls;

  const QuestionDetailArgs({
    required this.title,
    required this.description,
    required this.technologyId,
    required this.developerLevelId,
    this.urls,
  });
}
