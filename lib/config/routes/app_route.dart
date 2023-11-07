import 'package:flutter/material.dart';
import 'package:promodoro_app/config/routes/route_constant.dart';
import 'package:promodoro_app/core/utils/colors.dart';
import 'package:promodoro_app/core/utils/strings.dart';
import 'package:promodoro_app/feature/view/promodoro_home/home_screen.dart';
import 'package:promodoro_app/feature/view/promodoro_settings/settings_screen.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.home:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.home),
            builder: (context) => const PromodoroHomeScreen());
      case RouteConstants.settings:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.settings),
            builder: (context) => const PromodoroSettingsScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  backgroundColor: ColorPicker.darkBackgroundColor,
                  body: Center(child: Text(AppStrings.noPageFound)),
                ));
    }
  }
}
