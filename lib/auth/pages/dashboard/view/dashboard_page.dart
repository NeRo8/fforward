import 'package:fforward_adm/auth/pages/dashboard/controller/dashboard_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  static const routeName = '/dashboard-page';

  final DashboardController _controller = Get.find<DashboardController>();

  DashboardPage({super.key});

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
        body: null,
      );
}
