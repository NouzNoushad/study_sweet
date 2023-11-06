import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promodoro_app/feature/cubit/timer/timer_cubit.dart';

class TimerControls extends StatelessWidget {
  const TimerControls({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        var timer = BlocProvider.of<TimerCubit>(context);
        return Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              IconButton(
                  onPressed: () {
                    timer.resetTimer;
                  },
                  icon: const Icon(Icons.replay)),
              IconButton(
                  onPressed: () {
                    context.read<TimerCubit>().startTimer;
                  },
                  icon: Icon(
                    timer.isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 40,
                  )),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.fast_forward)),
            ]));
      },
    );
  }
}
