import 'package:fforward_adm/admin/pages/developer_levels/developer_levels_detail/view/developer_levels_detail.dart';
import 'package:fforward_adm/admin/pages/developer_levels/developer_levels_list/controller/developer_levels_list_controller.dart';
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

  void onTapCreateDeveloperLevel() =>
      Get.toNamed(DeveloperLevelsDetail.routeName);

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
          tableQuery: _controller.developerLevelsTable,
        ),
      );
}
