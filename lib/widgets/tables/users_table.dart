import 'package:fforward_adm/admin/users/users_list/controller/users_list_controller.dart';
import 'package:fforward_adm/models/users.dart';
import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutterfire_ui/database.dart';
import 'package:get/get.dart';

class UsersTable extends StatelessWidget {
  final UsersListController _controller = Get.find<UsersListController>();

  UsersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: FirebaseDatabaseListView(
            query: _controller.usersTable,
            itemBuilder: (context, snapshot) {
              final Users user = Users.fromJson(snapshot.value as Map);
              return CTableRow(
                children: [
                  CTableCell(flex: 2, title: user.uid),
                  const CVerticalDivider(),
                  CTableCell(flex: 4, title: user.email),
                  const CVerticalDivider(),
                  CTableCell(flex: 4, title: user.firstname),
                  const CVerticalDivider(),
                  CTableCell(flex: 4, title: user.lastname),
                  const CVerticalDivider(),
                  CTableCell(flex: 3, title: user.permission),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class CTableRow extends StatelessWidget {
  final List<Widget> children;
  const CTableRow({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Row(
            children: children,
          ),
        ),
      );
}

class CTableCell extends StatelessWidget {
  final int flex;
  final String title;

  const CTableCell({
    super.key,
    this.flex = 1,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        flex: flex,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(title),
        ),
      );
}

class CVerticalDivider extends StatelessWidget {
  const CVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) => const VerticalDivider(
        thickness: 1,
        color: AppColors.borderColor,
      );
}
