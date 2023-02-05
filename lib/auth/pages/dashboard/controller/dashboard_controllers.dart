import 'package:fforward_adm/services/fb_auth_service.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final FBAuthService _authService;

  DashboardController({authService}) : _authService = authService;

  Future<void> onTabLogout() async => await _authService.onLogout();
}
