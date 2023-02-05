import 'package:fforward_adm/auth/pages/dashboard/controller/dashboard_bindings.dart';
import 'package:fforward_adm/auth/pages/dashboard/view/dashboard_page.dart';
import 'package:fforward_adm/auth/pages/login/controller/login_bindings.dart';
import 'package:fforward_adm/auth/pages/login/view/login_page.dart';
import 'package:fforward_adm/auth/pages/registration/controller/registration_bindings.dart';
import 'package:fforward_adm/auth/pages/registration/view/registration_page.dart';
import 'package:fforward_adm/auth/pages/splash/view/splash_page.dart';
import 'package:get/get.dart';

class GetPages {
  static List<GetPage<dynamic>>? get pages => [
        GetPage(
          name: SplashPage.routeName,
          page: SplashPage.new,
        ),
        GetPage(
          name: LoginPage.routeName,
          page: LoginPage.new,
          binding: LoginBindings(),
        ),
        GetPage(
          name: RegistrationPage.routeName,
          page: RegistrationPage.new,
          binding: RegistrationBindings(),
        ),
        GetPage(
          name: DashboardPage.routeName,
          page: DashboardPage.new,
          binding: DashboardBindings(),
        ),
      ];
}
