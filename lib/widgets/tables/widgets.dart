import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CTableRow extends StatelessWidget {
  final List<Widget> children;
  const CTableRow({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Row(
            children: children,
          ),
        ),
      );
}

class CTableCell extends StatelessWidget {
  final int flex;
  final String title;

  const CTableCell({
    super.key,
    this.flex = 1,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        flex: flex,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(title),
        ),
      );
}

class CVerticalDivider extends StatelessWidget {
  const CVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) => const VerticalDivider(
        thickness: 1,
        color: AppColors.borderColor,
      );
}
