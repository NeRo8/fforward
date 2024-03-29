import 'package:fforward_adm/admin/pages/review/review_list/controller/review_list_controller.dart';
import 'package:fforward_adm/controller/technologies_store_controller.dart';
import 'package:fforward_adm/controller/users_store_controller.dart';
import 'package:fforward_adm/models/review.dart';
import 'package:fforward_adm/admin/widgets/tables/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutterfire_ui/database.dart';
import 'package:get/get.dart';

class ReviewTable extends StatelessWidget {
  final ReviewListController _controller = Get.find<ReviewListController>();

  final UsersStoreController usersStoreController =
      Get.find<UsersStoreController>();
  final TechnologiesStoreController technologiesStoreController =
      Get.find<TechnologiesStoreController>();

  ReviewTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CTableRow(
          children: [
            CTableCell(flex: 1, title: "ID"),
            CVerticalDivider(),
            CTableCell(flex: 1, title: "Date start"),
            CVerticalDivider(),
            CTableCell(flex: 1, title: "Date end"),
            CVerticalDivider(),
            CTableCell(flex: 1, title: "Status"),
            CVerticalDivider(),
            CTableCell(flex: 3, title: "Developer"),
            CVerticalDivider(),
            CTableCell(flex: 3, title: "Reviewers"),
            CVerticalDivider(),
            CTableCell(flex: 3, title: "Technologies"),
          ],
        ),
        Expanded(
          child: FirebaseDatabaseListView(
            query: _controller.reviewTable,
            itemBuilder: (context, snapshot) {
              final Review review = Review.fromJson((snapshot.value as Map));

              return CTableRow(
                children: [
                  CTableCell(flex: 1, title: review.id!),
                  const CVerticalDivider(),
                  CTableCell(
                    flex: 1,
                    title: review.getStartDateLabel,
                  ),
                  const CVerticalDivider(),
                  CTableCell(
                    flex: 1,
                    title: review.getEndDateLabel,
                  ),
                  const CVerticalDivider(),
                  CTableCell(
                    flex: 1,
                    title: review.status?.title,
                  ),
                  const CVerticalDivider(),
                  CTableCell(
                    flex: 3,
                    title: review.specialist.title,
                  ),
                  const CVerticalDivider(),
                  CTableCell(
                    flex: 3,
                    title: review.getReviewersLabel,
                  ),
                  const CVerticalDivider(),
                  CTableCell(
                    flex: 3,
                    title: review.getTechnologiesLabel,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
