import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final Widget child;

  const FormContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            decoration: const BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: child,
          ),
        ),
      );
}
