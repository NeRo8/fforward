import 'package:fforward_adm/admin/developer_levels/developer_levels_detail/controller/developer_levels_detail_bindings.dart';
import 'package:fforward_adm/admin/developer_levels/developer_levels_detail/view/developer_levels_detail.dart';
import 'package:fforward_adm/admin/developer_levels/developer_levels_list/controller/developer_levels_list_bindings.dart';
import 'package:fforward_adm/admin/developer_levels/developer_levels_list/view/developer_levels_list.dart';
import 'package:fforward_adm/admin/questions/questions_detail/controller/question_detail_bindings.dart';
import 'package:fforward_adm/admin/questions/questions_detail/view/question_detail.dart';
import 'package:fforward_adm/admin/questions/questions_list/controller/questions_list_bindings.dart';
import 'package:fforward_adm/admin/questions/questions_list/view/questions_list.dart';
import 'package:fforward_adm/admin/technologies/technology_detail/controller/technology_detail_bindings.dart';
import 'package:fforward_adm/admin/technologies/technology_detail/view/technology_detail.dart';
import 'package:fforward_adm/admin/technologies/technology_list/controller/technology_list_bindings.dart';
import 'package:fforward_adm/admin/technologies/technology_list/view/technology_list.dart';
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
        ),
        GetPage(
          name: TechnologyList.routeName,
          page: TechnologyList.new,
          binding: TechnologyListBindings(),
        ),
        GetPage(
          name: TechnologyDetail.routeName,
          page: TechnologyDetail.new,
          binding: TechnologyDetailBindings(),
        ),
        GetPage(
          name: QuestionsList.routeName,
          page: QuestionsList.new,
          binding: QuestionsListBindings(),
        ),
        GetPage(
          name: QuestionDetail.routeName,
          page: QuestionDetail.new,
          binding: QuestionDetailBindings(),
        ),
      ];
}
