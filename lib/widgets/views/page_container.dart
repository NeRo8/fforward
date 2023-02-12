import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  final String headerTitle;
  final List<Widget>? headerActions;
  final Widget child;

  const PageContainer({
    super.key,
    required this.headerTitle,
    this.headerActions,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(headerTitle),
          actions: headerActions,
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
