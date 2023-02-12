import 'package:fforward_adm/admin/developer_levels/developer_levels_detail/controller/developer_levels_detail_bindings.dart';
import 'package:fforward_adm/admin/developer_levels/developer_levels_detail/view/developer_levels_detail.dart';
import 'package:fforward_adm/admin/developer_levels/developer_levels_list/controller/developer_levels_list_bindings.dart';
import 'package:fforward_adm/admin/developer_levels/developer_levels_list/view/developer_levels_list.dart';
import 'package:fforward_adm/admin/users/users_list/controller/user_list_bindings.dart';
import 'package:fforward_adm/admin/users/users_list/view/users_list.dart';
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
        //MainApplication
        GetPage(
          name: UsersListPage.routeName,
          page: UsersListPage.new,
          binding: UsersListBindings(),
        ),
        GetPage(
          name: DeveloperLevelsList.routeName,
          page: DeveloperLevelsList.new,
          binding: DeveloperLevelsListBindings(),
        ),
        GetPage(
          name: DeveloperLevelsDetail.routeName,
          page: DeveloperLevelsDetail.new,
          binding: DeveloperLevelsDetailBindings(),
        )
      ];
}
