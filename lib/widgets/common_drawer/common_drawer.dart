import 'package:fforward_adm/admin/pages/developer_levels/developer_levels_list/view/developer_levels_list.dart';
import 'package:fforward_adm/admin/pages/questions/questions_list/view/questions_list.dart';
import 'package:fforward_adm/admin/pages/review/review_list/view/review_list.dart';
import 'package:fforward_adm/admin/pages/technologies/technology_list/view/technology_list.dart';
import 'package:fforward_adm/admin/pages/users/users_list/view/users_list.dart';
import 'package:fforward_adm/client/pages/dashboard/view/dashboard_page.dart';
import 'package:fforward_adm/controller/current_user_controller.dart';
import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDrawer extends StatelessWidget {
  CommonDrawer({super.key});

  final CurrentUserController currentUserController =
      Get.find<CurrentUserController>();

  @override
  Widget build(BuildContext context) => Drawer(
        child: Obx(
          () => ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    currentUserController.getCurrentUserFullname,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Dashboard'),
                onTap: () => Get.toNamed(DashboardPage.routeName),
              ),
              if (currentUserController.getCurrentUserIsAdmin) ...adminPages(),
              const Divider(
                thickness: 2,
                color: AppColors.borderColor,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
                onTap: currentUserController.onTapLogout,
              ),
            ],
          ),
        ),
      );
}

List<Widget> adminPages() => [
      const Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 32, bottom: 4),
        child: Text(
          'Catalogs',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const Divider(
        thickness: 2,
        color: AppColors.borderColor,
      ),
      ListTile(
        title: const Text('Reviews'),
        onTap: () => Get.toNamed(ReviewList.routeName),
      ),
      ListTile(
        title: const Text('Users'),
        onTap: () => Get.toNamed(UsersListPage.routeName),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 32, bottom: 4),
        child: Text(
          'System tables',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const Divider(
        thickness: 2,
        color: AppColors.borderColor,
      ),
      ListTile(
        title: const Text('Question'),
        onTap: () => Get.toNamed(QuestionsList.routeName),
      ),
      ListTile(
        title: const Text('Technologies'),
        onTap: () => Get.toNamed(TechnologyList.routeName),
      ),
      ListTile(
        title: const Text('Developer levels'),
        onTap: () => Get.toNamed(DeveloperLevelsList.routeName),
      ),
    ];
