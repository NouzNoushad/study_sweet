import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class AppBarActionButtons extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  final bool isDarkMode;
  const AppBarActionButtons(
      {super.key, required this.icon, required this.onPressed, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: isDarkMode
              ? ColorPicker.lightBackgroundColor
              : ColorPicker.darkBackgroundColor,
        ));
  }
}
