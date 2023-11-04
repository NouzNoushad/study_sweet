import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promodoro_app/config/routes/app_route.dart';
import 'package:promodoro_app/config/routes/route_constant.dart';
import 'package:promodoro_app/config/theme/app_theme.dart';
import 'package:promodoro_app/feature/cubit/theme_mode/theme_mode_cubit.dart';
import 'package:promodoro_app/feature/widget/bloc_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocWidget(
      child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
        builder: (context, state) {
          state as ThemeChangedState;
          return MaterialApp(
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: RouteConstants.home,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
