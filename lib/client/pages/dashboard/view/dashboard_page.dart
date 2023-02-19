import 'package:fforward_adm/client/pages/dashboard/controller/dashboard_controllers.dart';
import 'package:fforward_adm/resources/app_colors.dart';
import 'package:fforward_adm/widgets/common_drawer/common_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/review_list.dart';

class DashboardPage extends StatelessWidget {
  static const routeName = '/dashboard-page';

  final DashboardController _controller = Get.find<DashboardController>();

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: CommonDrawer(),
            appBar: AppBar(
              title: const Text('Dashboard'),
              bottom: PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: Material(
                  color: Colors.white,
                  child: _tabBar,
                ),
              ),
            ),
            body: TabBarView(
              children: [
                ReviewList(query: _controller.personalReviewQuery),
                ReviewList(query: _controller.reviewsAsReviewerQuery)
              ],
            )),
      );
}

TabBar get _tabBar => const TabBar(
      indicatorColor: AppColors.primaryColor,
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.secondaryColor,
      tabs: [
        Tab(
          icon: Icon(Icons.person),
          text: 'Personal reviews',
        ),
        Tab(icon: Icon(Icons.group), text: "Review as reviewer"),
      ],
    );
