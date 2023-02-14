import 'package:fforward_adm/admin/pages/review/review_detail/controller/review_detail_controller.dart';
import 'package:fforward_adm/widgets/views/form_container.dart';
import 'package:fforward_adm/widgets/views/page_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewDetail extends StatelessWidget {
  static const routeName = '/review-detail-page';

  final ReviewDetailController _controller = Get.find<ReviewDetailController>();

  ReviewDetail({super.key});

  @override
  Widget build(BuildContext context) => PageContainer(
        headerTitle: 'Review',
        child: FormContainer(
          formKey: _controller.reviewForm,
          onTapSubmit: _controller.onTapSubmit,
          children: [],
        ),
      );
}
