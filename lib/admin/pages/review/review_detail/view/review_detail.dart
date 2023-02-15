import 'package:fforward_adm/admin/pages/review/review_detail/controller/review_detail_controller.dart';
import 'package:fforward_adm/widgets/tables/date_form_field.dart';
import 'package:fforward_adm/widgets/tables/multiple_relative_form_field.dart';
import 'package:fforward_adm/widgets/tables/relative_form_field.dart';
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
        child: Obx(
          () => FormContainer(
            formKey: _controller.reviewForm,
            onTapSubmit: _controller.onTapSubmit,
            children: [
              DateFormField(
                controller: _controller.startDateController,
                onTap: _controller.onTapStartDate,
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Required field' : null,
                label: "Date start",
                hint: "Select start date",
              ),
              const SizedBox(
                height: 32,
              ),
              DateFormField(
                startDate: _controller.startDate.value,
                controller: _controller.endDateController,
                onTap: _controller.onTapEndDate,
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Required field' : null,
                label: "Date end",
                hint: "Select end date",
              ),
              const SizedBox(
                height: 32,
              ),
              RelativeFormField(
                value: _controller.userLabel,
                onTap: _controller.onTapUser,
                list: _controller.users,
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Required field' : null,
                label: "Specialist",
                hint: 'Select specialist',
              ),
              const SizedBox(
                height: 32,
              ),
              MultipleRelativeFormField(
                value: _controller.reviewersLabel,
                onTap: _controller.onTapReviewers,
                list: _controller.users,
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Required field' : null,
                label: "Reviewers",
                hint: "Select reviewers",
              ),
              const SizedBox(
                height: 32,
              ),
              MultipleRelativeFormField(
                value: _controller.technologiesLabel,
                onTap: _controller.onTapTechnology,
                list: _controller.technologies,
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Required field' : null,
                label: "Technologies",
                hint: "Select technologies",
              ),
              const SizedBox(
                height: 32,
              ),
              RelativeFormField(
                value: _controller.statusLabel,
                onTap: _controller.onTapStatus,
                list: _controller.statuses,
                label: "Status",
                hint: 'Select status',
              ),
            ],
          ),
        ),
      );
}
