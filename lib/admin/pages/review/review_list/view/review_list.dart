import 'package:fforward_adm/admin/pages/review/review_detail/view/review_detail.dart';
import 'package:fforward_adm/widgets/common_drawer/common_drawer.dart';
import 'package:fforward_adm/admin/widgets/tables/review_table.dart';
import 'package:fforward_adm/widgets/containers/page_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewList extends StatelessWidget {
  static const routeName = '/review-list-page';

  const ReviewList({super.key});

  void onTapCreateReview() => Get.toNamed(ReviewDetail.routeName);

  @override
  Widget build(BuildContext context) => PageContainer(
        drawer: CommonDrawer(),
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
