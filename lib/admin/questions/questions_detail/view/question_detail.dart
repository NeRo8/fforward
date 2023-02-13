import 'package:fforward_adm/admin/questions/questions_detail/controller/question_detail_controller.dart';
import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/resources/app_colors.dart';
import 'package:fforward_adm/widgets/tables/relative_form_field.dart';
import 'package:fforward_adm/resources/app_strings.dart';

import 'package:fforward_adm/widgets/views/form_container.dart';
import 'package:fforward_adm/widgets/views/page_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              RelativeFormField(
                value: _controller.developerLevelLabel,
                list: _controller.developerLevels,
                onTap: _controller.onTapDeveloperLevel,
                label: 'Developer level',
                hint: 'Select developer level',
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
              _UrlsContainer(
                urls: _controller.urls,
                onCreateUrl: _controller.onCreateUrl,
                onRemoveUrl: _controller.onRemoveUrl,
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      );
}

class _UrlsContainer extends StatefulWidget {
  final Map<String, dynamic> urls;
  final Function(Url) onCreateUrl;
  final Function(String) onRemoveUrl;

  const _UrlsContainer({
    required this.urls,
    required this.onCreateUrl,
    required this.onRemoveUrl,
  });

  @override
  _UrlsContainerState createState() => _UrlsContainerState();
}

class _UrlsContainerState extends State<_UrlsContainer> {
  final TextEditingController urlController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration:
            BoxDecoration(border: Border.all(color: AppColors.borderColor)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: urlController,
                decoration: const InputDecoration(labelText: 'Url'),
              ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add url'),
                ),
              )
            ],
          ),
        ),
      );
}
