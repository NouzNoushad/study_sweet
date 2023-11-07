import 'package:flutter/material.dart';
import 'package:promodoro_app/core/utils/strings.dart';
import 'package:promodoro_app/feature/widget/app_bar.dart';

class PromodoroSettingsScreen extends StatelessWidget {
  const PromodoroSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: promodoroAppBar(context, AppStrings.settingsTitle, [], true),
    );
  }
}
