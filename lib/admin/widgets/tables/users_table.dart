import 'package:fforward_adm/admin/pages/users/users_list/controller/users_list_controller.dart';
import 'package:fforward_adm/admin/widgets/tables/widgets.dart';
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
              final Map user = (snapshot.value as Map);
              return CTableRow(
                children: [
                  CTableCell(flex: 2, title: user['uid']),
                  const CVerticalDivider(),
                  CTableCell(flex: 4, title: user['email']),
                  const CVerticalDivider(),
                  CTableCell(flex: 4, title: user['firstname']),
                  const CVerticalDivider(),
                  CTableCell(flex: 4, title: user['lastname']),
                  const CVerticalDivider(),
                  CTableCell(flex: 3, title: user['permission']),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
