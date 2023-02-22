import 'package:fforward_adm/admin/pages/technologies/technology_detail/view/technology_detail.dart';
import 'package:fforward_adm/admin/pages/technologies/technology_list/controller/technology_list_controller.dart';
import 'package:fforward_adm/resources/app_strings.dart';
import 'package:fforward_adm/widgets/common_drawer/common_drawer.dart';
import 'package:fforward_adm/admin/widgets/tables/item_list_table.dart';
import 'package:fforward_adm/widgets/containers/page_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnologyList extends StatelessWidget {
  static const routeName = '/technology-list';

  final TechnologyListController _controller =
      Get.find<TechnologyListController>();

  TechnologyList({super.key});

  void onTapCreateDeveloperLevel() => Get.toNamed(TechnologyDetail.routeName);

  @override
  Widget build(BuildContext context) => PageContainer(
        drawer: CommonDrawer(),
        headerTitle: AppStrings.technology,
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
