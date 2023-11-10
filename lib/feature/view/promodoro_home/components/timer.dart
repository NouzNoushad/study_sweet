import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promodoro_app/core/utils/extensions.dart';
import 'package:promodoro_app/feature/cubit/timer/timer_cubit.dart';

import '../../../../core/utils/colors.dart';

class StudyTimer extends StatelessWidget {
  const StudyTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        var timer = state as UpdateTimerState;
        return Expanded(
            flex: 3,
            child: Center(
                child: timerContainer(
                    context,
                    timer.currentTimeValue,
                    timer.session,
                    timer.currentTime,
                    timer.progressTime,
                    timer.studyStatus)));
      },
    );
  }

  Widget timerContainer(BuildContext context, String displayTime, int session,
      int currentTime, int progressTime, String studyStatus) {
    print('/////////// curr: $currentTime, pro: $progressTime');
    return SizedBox(
      height: context.height * 0.3,
      width: context.height * 0.3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
              value: 1 - currentTime / progressTime,
              strokeWidth: 8,
              strokeCap: StrokeCap.round,
              color: ColorPicker.progressColor,
              backgroundColor: const Color.fromARGB(15, 0, 0, 0)),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(studyStatus.toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500, letterSpacing: 1)),
                Text(displayTime,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                        fontSize: 50)),
                Text('$session : 4',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Pacifico',
                        )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
