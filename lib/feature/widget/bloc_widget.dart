import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promodoro_app/feature/cubit/theme_mode/theme_mode_cubit.dart';
import 'package:promodoro_app/feature/cubit/timer/timer_cubit.dart';

class BlocWidget extends StatelessWidget {
  final Widget child;
  const BlocWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeModeCubit(),
        ),
        BlocProvider(
          create: (context) => TimerCubit(),
        ),
      ],
      child: child,
    );
  }
}
