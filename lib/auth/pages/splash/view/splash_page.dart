import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splash-page';

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Text(
            'Fast review',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 42,
            ),
          ),
        ),
      );
}
