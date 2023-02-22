import 'package:fforward_adm/admin/pages/review/review_detail/controller/review_detail_controller.dart';
import 'package:fforward_adm/models/technology.dart';
import 'package:fforward_adm/utils/validations.dart';
import 'package:fforward_adm/admin/widgets/tables/date_form_field.dart';
import 'package:fforward_adm/admin/widgets/tables/multiple_relative_form_field.dart';
import 'package:fforward_adm/admin/widgets/tables/relative_form_field.dart';
import 'package:fforward_adm/widgets/containers/form_container.dart';
import 'package:fforward_adm/widgets/containers/page_container.dart';
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
                validator: isEmptyValidation,
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
                validator: isEmptyValidation,
                label: "Date end",
                hint: "Select end date",
              ),
              const SizedBox(
                height: 32,
              ),
              RelativeFormField(
                value: _controller.selectedSpecialist.value,
                onTap: _controller.onTapSpecialist,
                list: _controller.specialists,
                validator: (_) => isListContainValidation(
                  _controller.selectedReviewers,
                  _controller.selectedSpecialist.value,
                ),
                label: "Specialist",
                hint: 'Select specialist',
              ),
              const SizedBox(
                height: 32,
              ),
              MultipleRelativeFormField(
                values: _controller.selectedReviewers,
                onTap: _controller.onTapReviewers,
                list: _controller.specialists,
                validator: (_) => isListContainValidation(
                  _controller.selectedReviewers,
                  _controller.selectedSpecialist.value,
                ),
                label: "Reviewers",
                hint: "Select reviewers",
              ),
              const SizedBox(
                height: 32,
              ),
              MultipleRelativeFormField<Technology>(
                values: _controller.selectedTechnologies,
                onTap: _controller.onTapTechnology,
                list: _controller.technologies,
                validator: isEmptyValidation,
                label: "Technologies",
                hint: "Select technologies",
              ),
              const SizedBox(
                height: 32,
              ),
              RelativeFormField(
                value: _controller.selectedStatus.value,
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
