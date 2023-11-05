import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  Timer? _timer;
  bool _timerRunning = false;
  int _currentTimer = 3000;

  bool get timerRunning => _timerRunning;
  int get currentTimer => _currentTimer;

  String displayCurrentTimer() {
    int minutes = _currentTimer ~/ 60;
    int seconds = _currentTimer % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  startTimer() {
    if (!_timerRunning) {
      _timerRunning = true;
      print('start');
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_currentTimer > 0) {
          _currentTimer--;
          displayCurrentTimer();
       
          emit(DisplayTimerState(displayCurrentTimer()));
        } else {
          _timer?.cancel();
          _timerRunning = false;
        }
      });
      emit(const UpdateTimerState());
    } else {
    
      _timerRunning = false;
      _timer?.cancel();
      emit(const UpdateTimerState());
    }
  }
}
