import 'package:fforward_adm/resources/app_colors.dart';
import 'package:fforward_adm/resources/app_strings.dart';
import 'package:fforward_adm/widgets/tables/users_table.dart';
import 'package:flutter/material.dart';

class UsersListPage extends StatelessWidget {
  static const routeName = '/users-list';

  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.users),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.borderColor),
            ),
            child: UsersTable(),
          ),
        ),
      );
}
