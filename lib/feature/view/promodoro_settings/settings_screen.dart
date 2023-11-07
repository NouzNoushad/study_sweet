import 'package:flutter/material.dart';
import 'package:promodoro_app/core/utils/strings.dart';
import 'package:promodoro_app/feature/view/promodoro_settings/components/settings_slider.dart';
import 'package:promodoro_app/feature/widget/app_bar.dart';

class PromodoroSettingsScreen extends StatelessWidget {
  const PromodoroSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: promodoroAppBar(context, AppStrings.settingsTitle, [], true),
        body: Column(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SettingsSlider(
                    title: "Study Duration",
                    value: 0.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SettingsSlider(
                    title: "Break Duration",
                    value: 0.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SettingsSlider(
                    title: "Sessions",
                    value: 0.5,
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
        ));
  }
}
