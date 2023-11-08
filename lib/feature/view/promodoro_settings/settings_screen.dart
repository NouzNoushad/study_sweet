import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promodoro_app/core/utils/strings.dart';
import 'package:promodoro_app/feature/cubit/settings_cubit/settings_cubit.dart';
import 'package:promodoro_app/feature/view/promodoro_settings/components/settings_slider.dart';
import 'package:promodoro_app/feature/widget/app_bar.dart';

class PromodoroSettingsScreen extends StatelessWidget {
  const PromodoroSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: promodoroAppBar(context, AppStrings.settingsTitle, [], true),
        body: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            state as UpdateSettings;
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SettingsSlider(
                        title: "Study Duration",
                        min: 1,
                        max: 60,
                        value: state.studyDuration,
                        onChanged: context
                            .read<SettingsCubit>()
                            .onChangedStudyDuration,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SettingsSlider(
                        title: "Break Duration",
                        min: 1,
                        max: 30,
                        value: state.breakDuration,
                        onChanged: context
                            .read<SettingsCubit>()
                            .onChangedBreakDuration,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SettingsSlider(
                        title: "Sessions",
                        min: 1,
                        max: 15,
                        value: state.sessions,
                        onChanged:
                            context.read<SettingsCubit>().onChangedSessions,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Notifications'),
                          Switch(value: false, onChanged: (value) {}),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Dark Mode'),
                          Switch(value: false, onChanged: (value) {}),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Autostart'),
                          Switch(value: false, onChanged: (value) {}),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            );
          },
        ));
  }
}
