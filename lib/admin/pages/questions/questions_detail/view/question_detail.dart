import 'package:fforward_adm/admin/pages/questions/questions_detail/controller/question_detail_controller.dart';
import 'package:fforward_adm/models/developer_level.dart';
import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/models/technology.dart';
import 'package:fforward_adm/resources/app_colors.dart';
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
              RelativeFormField<Technology>(
                value: _controller.technology.value,
                list: _controller.technologies,
                onTap: _controller.onTapTechnology,
                hint: 'Select technology',
                label: 'Technology',
              ),
              const SizedBox(
                height: 32,
              ),
              RelativeFormField<DeveloperLevel>(
                value: _controller.developerLevel.value,
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
                controller: _controller.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter description',
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              _UrlsContainer(
                urls: _controller.urlsList,
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
  final List<Url> urls;
  final Function(String, String) onCreateUrl;
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
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Resources:',
                style: TextStyle(color: AppColors.secondaryColor),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: InkWell(
                  onTap: () => Get.bottomSheet(
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Create url',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                SizedBox(
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () => widget.onCreateUrl(
                                        urlController.text,
                                        titleController.text),
                                    child: const Text('Add url'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextField(
                              controller: urlController,
                              decoration: const InputDecoration(
                                  labelText: 'Url', hintText: "Enter url"),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextField(
                              controller: titleController,
                              decoration: const InputDecoration(
                                labelText: "Title",
                                hintText: "Enter title",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    backgroundColor: Colors.white,
                  ).then((value) =>
                      {urlController.text = '', titleController.text = ''}),
                  child: const Icon(Icons.add_circle),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.urls.length,
            itemBuilder: (ctx, index) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColors.borderColor)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.urls[index].title),
                          InkWell(
                            onTap: () =>
                                widget.onRemoveUrl(widget.urls[index].url),
                            child: const Icon(
                              Icons.remove_circle,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ]),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      );
}
