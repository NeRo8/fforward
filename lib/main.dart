import 'package:fforward_adm/auth/pages/splash/view/splash_page.dart';
import 'package:fforward_adm/controller/global_bindings.dart';
import 'package:fforward_adm/pages.dart';
import 'package:fforward_adm/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "fforward-app",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        initialRoute: SplashPage.routeName,
        getPages: GetPages.pages,
        initialBinding: GlobalBindings(),
      );
}
