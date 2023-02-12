import 'package:fforward_adm/admin/developer_levels/developer_levels_detail/controller/developer_levels_detail_controller.dart';
import 'package:fforward_adm/resources/app_strings.dart';
import 'package:fforward_adm/widgets/views/page_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeveloperLevelsDetail extends StatelessWidget {
  static const routeName = '/developer-levels-detail';

  final DeveloperLevelsDetailController _controller =
      Get.find<DeveloperLevelsDetailController>();

  DeveloperLevelsDetail({super.key});

  @override
  Widget build(BuildContext context) => PageContainer(
        headerTitle: AppStrings.developerLevels,
        child: Form(
          key: _controller.developerLevelFormKey,
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
