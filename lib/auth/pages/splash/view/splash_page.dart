import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splash-page';

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('SplashScreen'),
        ),
        body: SizedBox(),
      );
}