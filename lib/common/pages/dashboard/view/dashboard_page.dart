import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  static const routeName = '/dashboard-page';

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: null,
      );
}
