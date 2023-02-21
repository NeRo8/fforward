import 'package:fforward_adm/client/pages/review_form/controller/review_form_controller.dart';
import 'package:fforward_adm/models/question.dart';
import 'package:fforward_adm/resources/app_colors.dart';
import 'package:fforward_adm/utils/urls.dart';
import 'package:fforward_adm/widgets/pickers/level_picker/level_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewForm extends StatelessWidget {
  static const routeName = '/review-form';

  final ReviewFormController _controller = Get.find<ReviewFormController>();

  ReviewForm({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Review Form')),
        body: Obx(
          () => ListView.builder(
              itemCount: _controller.questions.length,
              itemBuilder: (context, index) {
                final question = _controller.questions[index];
                return Obx(
                  () => _QuestionItemList(
                    question: question,
                    levelId: _controller.answers[question.id],
                    onTapLevel: _controller.onTapAnswers,
                  ),
                );
              }),
        ),
      );
}

class _QuestionItemList extends StatelessWidget {
  final Question question;
  final String? levelId;
  final Function({required String questionId, required String levelId})
      onTapLevel;

  const _QuestionItemList({
    required this.question,
    required this.levelId,
    required this.onTapLevel,
  });

  void onTapItem(String levelId) => onTapLevel(
        questionId: question.id!,
        levelId: levelId,
      );

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _InfoBlockItem(
                      label: "Developer level: ",
                      text: question.developerLevel.title),
                  const SizedBox(
                    height: 16,
                  ),
                  _InfoBlockItem(
                      label: "Technology: ", text: question.technology.title),
                  const SizedBox(
                    height: 16,
                  ),
                  _InfoBlockItem(
                      label: "Question title: ", text: question.title),
                  const SizedBox(
                    height: 16,
                  ),
                  if (question.description.isNotEmpty) ...[
                    _InfoBlockItem(
                      label: "Description: ",
                      text: question.description,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                  if (question.urls != null) ...[
                    Row(
                      children: [
                        const Text(
                          "Links: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ...question.urls!.values
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: InkWell(
                                  onTap: () => onTapLink(e.url),
                                  child: Text(
                                    e.title,
                                    style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                  LevelPicker(levelId: levelId, onTapLevel: onTapItem),
                ],
              ),
            ),
          ),
        ),
      );
}

class _InfoBlockItem extends StatelessWidget {
  final String label;
  final String text;

  const _InfoBlockItem({required this.label, required this.text});

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(text),
          ),
        ],
      );
}
