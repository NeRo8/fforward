import 'package:fforward_adm/admin/technologies/technology_list/controller/technology_list_controller.dart';
import 'package:fforward_adm/resources/app_strings.dart';
import 'package:fforward_adm/widgets/tables/item_list_table.dart';
import 'package:fforward_adm/widgets/views/page_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnologyList extends StatelessWidget {
  static const routeName = '/technology-list';

  final TechnologyListController _controller =
      Get.find<TechnologyListController>();

  TechnologyList({super.key});

  void onTapCreateDeveloperLevel() => Get.toNamed(TechnologyDatail.routeName);

  @override
  Widget build(BuildContext context) => PageContainer(
        headerTitle: AppStrings.developerLevels,
        headerActions: [
          IconButton(
            onPressed: onTapCreateDeveloperLevel,
            icon: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 32,
          ),
        ],
        child: ItemListTable(
          tableQuery: _controller.technologyTable,
        ),
      );
}
