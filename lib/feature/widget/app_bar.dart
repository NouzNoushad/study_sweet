import 'package:flutter/material.dart';

AppBar promodoroAppBar(
  BuildContext context,
  String appTitle,
  List<Widget>? actions,
  bool leading,
) =>
    AppBar(
      title: Text(
        appTitle,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontFamily: 'Pacifico',
            ),
      ),
      automaticallyImplyLeading: leading,
      elevation: 0.0,
      actions: actions,
    );
