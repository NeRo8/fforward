import 'package:fforward_adm/admin/pages/users/users_list/controller/users_list_controller.dart';
import 'package:fforward_adm/admin/widgets/tables/widgets.dart';
import 'package:fforward_adm/models/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersTable extends StatelessWidget {
  final UsersListController _controller = Get.find<UsersListController>();

  UsersTable({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const CTableRow(
            children: [
              CTableCell(flex: 2, title: "ID"),
              CVerticalDivider(),
              CTableCell(flex: 4, title: "Email"),
              CVerticalDivider(),
              CTableCell(flex: 4, title: "First name"),
              CVerticalDivider(),
              CTableCell(flex: 4, title: "Last name"),
              CVerticalDivider(),
              CTableCell(flex: 3, title: "Permission"),
            ],
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _controller.usersTable.length,
                itemBuilder: (context, index) {
                  final Users item = _controller.usersTable[index];

                  return CTableRow(
                    children: [
                      CTableCell(flex: 2, title: item.uid),
                      const CVerticalDivider(),
                      CTableCell(flex: 4, title: item.email),
                      const CVerticalDivider(),
                      CTableCell(flex: 4, title: item.firstname),
                      const CVerticalDivider(),
                      CTableCell(flex: 4, title: item.lastname),
                      const CVerticalDivider(),
                      CTableCell(flex: 3, title: item.permission),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      );
}
