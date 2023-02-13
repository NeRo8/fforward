import 'package:fforward_adm/admin/questions/questions_detail/controller/question_detail_controller.dart';
import 'package:fforward_adm/widgets/tables/relative_form_field.dart';
import 'package:fforward_adm/resources/app_strings.dart';

import 'package:fforward_adm/widgets/views/form_container.dart';
import 'package:fforward_adm/widgets/views/page_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionDetail extends StatelessWidget {
  static const routeName = '/question-detail';

  final QuestionDetailController _controller =
      Get.find<QuestionDetailController>();

  QuestionDetail({super.key});

  @override
  Widget build(BuildContext context) => PageContainer(
        headerTitle: AppStrings.questions,
        child: Obx(
          () => FormContainer(
            formKey: _controller.questionFormKey,
            onTapSubmit: _controller.onTapSubmit,
            children: [
              RelativeFormField(
                value: _controller.technologyLabel,
                list: _controller.technologies,
                onTap: _controller.onTapTechnology,
                hint: 'Select technology',
                label: 'Technology',
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Developer level',
                  hintText: 'Select developer level',
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: _controller.titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter title',
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                maxLines: 20,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter description',
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Urls',
                  hintText: 'Select urls',
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      );
}
