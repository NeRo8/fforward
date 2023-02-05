import 'package:fforward_adm/common/pages/splash/view/splash_page.dart';
import 'package:fforward_adm/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        initialRoute: SplashPage.routeName,
        getPages: GetPages.pages,
      );
}
