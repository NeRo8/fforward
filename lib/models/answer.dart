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
