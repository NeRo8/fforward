import 'package:fforward_adm/admin/pages/developer_levels/developer_levels_list/view/developer_levels_list.dart';
import 'package:fforward_adm/admin/pages/questions/questions_list/view/questions_list.dart';
import 'package:fforward_adm/admin/pages/technologies/technology_list/view/technology_list.dart';
import 'package:fforward_adm/admin/pages/users/users_list/view/users_list.dart';
import 'package:fforward_adm/auth/pages/dashboard/controller/dashboard_controllers.dart';
import 'package:fforward_adm/resources/app_colors.dart';
import 'package:fforward_adm/resources/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  static const routeName = '/dashboard-page';

  final DashboardController _controller = Get.find<DashboardController>();

  DashboardPage({super.key});

  void _onTap() {}

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          actions: [
            IconButton(
              onPressed: _controller.onTabLogout,
              icon: const Icon(Icons.logout),
            ),
            const SizedBox(width: 16)
          ],
        ),
        body: Wrap(
          children: [
            CommonButton(
              title: AppStrings.users,
              onTap: () => Get.toNamed(UsersListPage.routeName),
            ),
            CommonButton(
              title: AppStrings.developerLevels,
              onTap: () => Get.toNamed(DeveloperLevelsList.routeName),
            ),
            CommonButton(
              title: AppStrings.technology,
              onTap: () => Get.toNamed(TechnologyList.routeName),
            ),
            CommonButton(
              title: AppStrings.questions,
              onTap: () => Get.toNamed(QuestionsList.routeName),
            ),
          ],
        ),
      );
}

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CommonButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) => Container(
        height: 50,
        margin: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.secondaryColor,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(title),
          ),
        ),
      );
}
