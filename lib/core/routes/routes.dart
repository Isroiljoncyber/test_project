import 'package:flutter/cupertino.dart';
import 'package:test_project/assets/constants/app_consts.dart';
import 'package:test_project/core/singleton/service_locator.dart';
import 'package:test_project/core/storage/storage_repo.dart';
import 'package:test_project/features/auth/presentation/auth_page.dart';
import 'package:test_project/features/profile/presentation/profile_page.dart';

class Routes {
  static const auth = '/';
  static const profile = '/profile';

  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    final Map<String, dynamic>? args = routeSettings.arguments as Map<String, dynamic>?;
    args ?? <String, dynamic>{};
    var route = routeSettings.name;
    if (StorageRepository.getString(AppConstants.token, defValue: '').isNotEmpty) route = profile;
    try {
      switch (route) {
        case profile:
          return CupertinoPageRoute(
            builder: (_) => const ProfilePage(),
          );
        default:
          return CupertinoPageRoute(
            builder: (_) => AuthPage(),
          );
      }
    } catch (e) {
      return CupertinoPageRoute(
        builder: (_) => AuthPage(),
      );
    }
  }
}
