import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  final String headerTitle;
  final Widget child;

  const PageContainer(
      {super.key, required this.headerTitle, required this.child});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(headerTitle),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.borderColor),
            ),
            child: child,
          ),
        ),
      );
}
