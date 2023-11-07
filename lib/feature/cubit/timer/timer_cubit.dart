import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit()
      : super(const UpdateTimerState('00:30', 2 * 60, false, 1, 2, 'Study'));

  Timer? _timer;
  bool _isPlaying = false;
  bool _isBreakTime = false;
  int _currentTime = 2 * 60;
  int _progressTime = 2;
  String _currentTimeValue = '00:30';
  int _session = 1;

  Timer get timer => _timer!;
  bool get isPlaying => _isPlaying;
  bool get isBreakTime => _isBreakTime;
  int get currentTime => _currentTime;
  int get progressTime => _progressTime;
  int get session => _session;
  String get currentTimeValue => _currentTimeValue;

  void get startTimer => _startTimer();
  void get resetTimer => _resetTimer();
  void get skipTimer => _skipTimer();

  String get studyStatus => _isBreakTime ? 'Break' : 'Study';

  _runTimer(int time) {
    if (_currentTime >= 0) {
      var currentTimeInMinutes = _currentTime ~/ 60;
      var currentTimeInSeconds = _currentTime % 60;
      _currentTime--;
      _currentTimeValue =
          '${currentTimeInMinutes.toString().padLeft(2, '0')}:${currentTimeInSeconds.toString().padLeft(2, '0')}';
      emit(UpdateTimerState(_currentTimeValue, _currentTime, _isPlaying,
          _session, _progressTime, studyStatus));
    } else {
      _isBreakTime = !_isBreakTime;
      if (_isBreakTime) {
        if (_session < 4) {
          _currentTime = 1 * 60;
          _progressTime = 1;
        }
      } else if (_session < 4) {
        _currentTime = 2 * 60;
        _progressTime = 2;
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
      emit(UpdateTimerState(_currentTimeValue, _currentTime, _isPlaying,
          _session, _progressTime, studyStatus));
    }
  }

  void _skipTimer() {
    if (_isBreakTime) {
      _currentTime = 2 * 60;
      _progressTime = 2;
    } else {
      _currentTime = 1 * 60;
      _progressTime = 1;
    }
    _isBreakTime = !_isBreakTime;
  }

  void _resetTimer() {
    _timer?.cancel();
    _currentTimeValue = '00:30';
    _isPlaying = false;
    emit(UpdateTimerState(_currentTimeValue, _currentTime, _isPlaying, _session,
        _progressTime, studyStatus));
  }
}
