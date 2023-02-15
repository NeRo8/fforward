import 'package:fforward_adm/admin/pages/review/review_detail/view/review_detail.dart';
import 'package:fforward_adm/controller/users_store_controller.dart';
import 'package:fforward_adm/widgets/tables/review_table.dart';
import 'package:fforward_adm/widgets/views/page_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewList extends StatelessWidget {
  static const routeName = '/review-list-page';

  const ReviewList({super.key});

  void onTapCreateReview() => Get.toNamed(ReviewDetail.routeName);

  @override
  Widget build(BuildContext context) => PageContainer(
        headerTitle: 'Review',
        headerActions: [
          IconButton(
            onPressed: onTapCreateReview,
            icon: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 32,
          ),
        ],
        child: ReviewTable(),
      );
}
