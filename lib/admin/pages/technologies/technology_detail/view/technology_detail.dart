import 'package:fforward_adm/admin/pages/technologies/technology_detail/controller/technology_detail_controller.dart';
import 'package:fforward_adm/resources/app_strings.dart';
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
        child: Form(
          key: _controller.technologyFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        value!.isNotEmpty ? null : AppStrings.requiredField,
                    controller: _controller.titleController,
                    decoration: const InputDecoration(
                      labelText: "Title",
                      hintText: "Enter title",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _controller.onTapSubmit,
                  child: const Text(AppStrings.submit),
                )
              ],
            ),
          ),
        ),
      );
}
