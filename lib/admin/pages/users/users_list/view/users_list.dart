import 'package:fforward_adm/resources/app_strings.dart';
import 'package:fforward_adm/widgets/common_drawer/common_drawer.dart';
import 'package:fforward_adm/widgets/tables/users_table.dart';
import 'package:fforward_adm/widgets/views/page_container.dart';
import 'package:flutter/material.dart';

class UsersListPage extends StatelessWidget {
  static const routeName = '/users-list';

  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) => PageContainer(
        drawer: CommonDrawer(),
        headerTitle: AppStrings.users,
        child: UsersTable(),
      );
}
