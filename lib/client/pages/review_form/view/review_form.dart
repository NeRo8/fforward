import 'package:fforward_adm/client/pages/review_form/controller/review_form_controller.dart';
import 'package:fforward_adm/models/question.dart';
import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewForm extends StatelessWidget {
  static const routeName = '/review-form';

  final ReviewFormController _controller = Get.find<ReviewFormController>();

  ReviewForm({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Review Form')),
        body: FirebaseDatabaseListView(
          query: _controller.getReactQuestions,
          itemBuilder: (context, snapshot) {
            final Question question =
                Question.fromJson((snapshot.value as Map));

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        _InfoBlockItem(
                            label: "Question title: ", text: question.title),
                        const SizedBox(
                          height: 16,
                        ),
                        if (question.description.isNotEmpty)
                          _InfoBlockItem(
                            label: "Description:",
                            text: question.description,
                          ),
                        if (question.urls != null)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Links:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: question.urls!.values
                                      .map(
                                        (e) => InkWell(
                                          onTap: () async {
                                            final Uri url = Uri.parse(e.url);
                                            final canLaunch =
                                                await canLaunchUrl(url);

                                            if (canLaunch) {
                                              await launchUrl(url);
                                            } else {
                                              Get.snackbar("Erorr",
                                                  "Urls in no longer valid");
                                            }
                                          },
                                          child: Text(
                                            e.title,
                                            style: const TextStyle(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              )
                            ],
                          )
                      ],
                    ),
                  )),
            );
          },
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
