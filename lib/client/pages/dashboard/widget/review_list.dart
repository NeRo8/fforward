import 'package:fforward_adm/client/pages/review_form/view/review_form_args.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import 'package:fforward_adm/client/pages/review_form/view/review_form.dart';
import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/models/review.dart';
import 'package:fforward_adm/resources/app_colors.dart';

class ReviewList extends StatelessWidget {
  final Query _query;

  const ReviewList({super.key, query}) : _query = query;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: FirebaseDatabaseListView(
            query: _query,
            itemBuilder: (context, snapshot) {
              final Review review = Review.fromJson((snapshot.value as Map));
              final currentStatus = reviewStatuses[review.status!.id];

              void onTap() => Get.toNamed(
                    ReviewForm.routeName,
                    arguments: ReviewFormArgs(review: review),
                  );

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _InfoBlock(review: review),
                        DecoratedBox(
                          decoration:
                              BoxDecoration(color: currentStatus!.color),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            child: Text(
                              currentStatus.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
}

class _InfoBlock extends StatelessWidget {
  final Review review;

  const _InfoBlock({
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InfoBlockItem(
            label: "Specialist name: ", text: review.specialist.title),
        const SizedBox(
          height: 8,
        ),
        _InfoBlockItem(label: "Reviewers: ", text: review.getReviewersLabel),
        const SizedBox(
          height: 8,
        ),
        _InfoBlockItem(
            label: "Technologies: ", text: review.getTechnologiesLabel),
        const SizedBox(
          height: 8,
        ),
        Row(children: [
          _InfoBlockItem(
            label: "Date start: ",
            text: review.getStartDateLabel,
          ),
          const SizedBox(
            width: 16,
          ),
          _InfoBlockItem(
            label: "Date end: ",
            text: review.getEndDateLabel,
          ),
          const SizedBox(
            width: 16,
          ),
        ]),
      ],
    );
  }
}

class _InfoBlockItem extends StatelessWidget {
  final String label;
  final String text;

  const _InfoBlockItem({required this.label, required this.text});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(text),
        ],
      );
}
