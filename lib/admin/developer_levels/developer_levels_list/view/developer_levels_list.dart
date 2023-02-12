import 'package:fforward_adm/admin/developer_levels/developer_levels_list/controller/developer_levels_list_controller.dart';
import 'package:fforward_adm/resources/app_strings.dart';
import 'package:fforward_adm/widgets/tables/item_list_table.dart';
import 'package:fforward_adm/widgets/views/page_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeveloperLevelsList extends StatelessWidget {
  static const routeName = '/developer-levels-list';

  final DeveloperLevelsListController _controller =
      Get.find<DeveloperLevelsListController>();

  DeveloperLevelsList({super.key});

  @override
  Widget build(BuildContext context) => PageContainer(
        headerTitle: AppStrings.developerLevels,
        child: ItemListTable(
          tableQuery: _controller.developerLevelsTable,
        ),
      );
}
