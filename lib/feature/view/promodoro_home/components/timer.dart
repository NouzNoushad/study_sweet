import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promodoro_app/core/utils/extensions.dart';
import 'package:promodoro_app/feature/cubit/timer/timer_cubit.dart';

import '../../../../core/utils/colors.dart';

class StudyTimer extends StatelessWidget {
  const StudyTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Center(child: BlocBuilder<TimerCubit, TimerState>(
          builder: (context, state) {
            if (state is DisplayTimerState) {
              return timerContainer(context, state.displayTime);
            }
            return timerContainer(context, '00:00');
          },
        )));
  }

  Widget timerContainer(BuildContext context, String displayTime) => SizedBox(
        height: context.height * 0.3,
        width: context.height * 0.3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const CircularProgressIndicator(
              value: 1,
              strokeWidth: 8,
              strokeCap: StrokeCap.round,
              color: ColorPicker.progressColor,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Study',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        )),
                Text(displayTime,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 50)),
                Text('1 : 4',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        )),
              ],
            ),
          ],
        ),
      );
}
