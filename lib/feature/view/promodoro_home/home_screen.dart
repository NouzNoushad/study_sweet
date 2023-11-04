import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promodoro_app/core/utils/colors.dart';
import 'package:promodoro_app/core/utils/strings.dart';
import 'package:promodoro_app/feature/cubit/theme_mode/theme_mode_cubit.dart';
import 'package:promodoro_app/feature/view/promodoro_home/components/timer.dart';
import 'package:promodoro_app/feature/view/promodoro_home/components/timer_controls.dart';

class PromodoroHomeScreen extends StatelessWidget {
  const PromodoroHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.appTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: [
          BlocBuilder<ThemeModeCubit, ThemeModeState>(
            builder: (context, state) {
              state as ThemeChangedState;
              return IconButton(
                  onPressed: () {
                    context.read<ThemeModeCubit>().switchThemeMode();
                  },
                  icon: Icon(
                    state.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: state.isDarkMode
                        ? ColorPicker.lightBackgroundColor
                        : ColorPicker.darkBackgroundColor,
                  ));
            },
          ),
        ],
      ),
      body: const Column(children: [
        StudyTimer(),
        TimerControls(),
      ]),
    );
  }
}
