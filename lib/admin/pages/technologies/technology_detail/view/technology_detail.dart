import 'package:fforward_adm/admin/pages/technologies/technology_detail/controller/technology_detail_controller.dart';
import 'package:fforward_adm/resources/app_strings.dart';
import 'package:fforward_adm/utils/validations.dart';
import 'package:fforward_adm/widgets/views/form_container.dart';
import 'package:fforward_adm/widgets/views/page_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnologyDetail extends StatelessWidget {
  static const routeName = '/technology-detail';

  final TechnologyDetailController _controller =
      Get.find<TechnologyDetailController>();

  TechnologyDetail({super.key});

  @override
  Widget build(BuildContext context) => PageContainer(
        headerTitle: AppStrings.technology,
        child: FormContainer(
          formKey: _controller.technologyFormKey,
          onTapSubmit: _controller.onTapSubmit,
          children: [
            TextFormField(
              validator: isEmptyValidation,
              controller: _controller.titleController,
              decoration: const InputDecoration(
                labelText: "Title",
                hintText: "Enter title",
              ),
            ),
          ],
        ),
      );
}
