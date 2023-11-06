import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const UpdateTimerState('00:30', 01 * 30, false, 1));

  Timer? _timer;
  bool _isPlaying = false;
  int _currentTime = 01 * 30;
  String _currentTimeValue = '00:30';
  int _session = 1;

  Timer get timer => _timer!;
  bool get isPlaying => _isPlaying;
  int get currentTime => _currentTime;
  int get session => _session;
  String get currentTimeValue => _currentTimeValue;

  void get startTimer => _startTimer();
  void get resetTimer => _resetTimer();

  _runTimer(int time) {
    if (_currentTime >= 0) {
      var currentTimeInMinutes = _currentTime ~/ 60;
      var currentTimeInSeconds = _currentTime % 60;
      _currentTime--;
      _currentTimeValue =
          '${currentTimeInMinutes.toString().padLeft(2, '0')}:${currentTimeInSeconds.toString().padLeft(2, '0')}';
      emit(UpdateTimerState(
          _currentTimeValue, _currentTime, _isPlaying, _session));
    } else {
      if (_session < 4) {
        _currentTime = 01 * 30;
        _session++;
      }
    }
  }

  void _startTimer() {
    if (!_isPlaying) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _runTimer(_currentTime);
      });
      _isPlaying = true;
    } else {
      _timer?.cancel();
      _isPlaying = false;
      emit(UpdateTimerState(
          _currentTimeValue, _currentTime, _isPlaying, _session));
    }
  }

  void _resetTimer() {
    _timer?.cancel();
    _currentTimeValue = '00:30';
    _isPlaying = false;
    emit(UpdateTimerState(
        _currentTimeValue, _currentTime, _isPlaying, _session));
  }
}
