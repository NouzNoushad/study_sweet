import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promodoro_app/config/routes/route_constant.dart';
import 'package:promodoro_app/core/utils/strings.dart';
import 'package:promodoro_app/feature/cubit/theme_mode/theme_mode_cubit.dart';
import 'package:promodoro_app/feature/cubit/timer/timer_cubit.dart';
import 'package:promodoro_app/feature/view/promodoro_home/components/action_buttons.dart';
import 'package:promodoro_app/feature/view/promodoro_home/components/timer.dart';
import 'package:promodoro_app/feature/view/promodoro_home/components/timer_controls.dart';
import 'package:promodoro_app/feature/widget/app_bar.dart';

class PromodoroHomeScreen extends StatelessWidget {
  const PromodoroHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: promodoroAppBar(
        context,
        AppStrings.appTitle,
        [
          BlocBuilder<ThemeModeCubit, ThemeModeState>(
            builder: (context, state) {
              state as ThemeChangedState;
              return AppBarActionButtons(
                  icon: state.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  onPressed: () {
                    context.read<ThemeModeCubit>().switchThemeMode();
                  },
                  isDarkMode: state.isDarkMode);
            },
          ),
        
        ],
        false,
      ),
      body: const Column(children: [
        StudyTimer(),
        TimerControls(),
      ]),
    );
  }
}
