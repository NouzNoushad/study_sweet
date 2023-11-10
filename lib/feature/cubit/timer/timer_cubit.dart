import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit()
      : super(const UpdateTimerState(
            '25:00', 25 * 60, false, 1, 25 * 60, 'Study'));

  Timer? _timer;
  bool _isPlaying = false;
  bool _isBreakTime = false;
  int _currentTime = 25 * 60;
  int _studyTime = 25 * 60;
  int _breakTime = 5 * 60;
  int _sessionTime = 1 * 60;
  String _currentTimeValue = '25:00';
  int _session = 1;

  Timer get timer => _timer!;
  bool get isPlaying => _isPlaying;
  bool get isBreakTime => _isBreakTime;
  int get currentTime => _currentTime;
  int get studyTime => _studyTime;
  int get breakTime => _breakTime;
  int get sessionTime => _sessionTime;
  int get session => _session;
  String get currentTimeValue => _currentTimeValue;

  void get startTimer => _startTimer();
  void get resetTimer => _resetTimer();
  void get skipTimer => _skipTimer();

  String get studyStatus => _isBreakTime ? 'Break' : 'Study';

  int get maxTime => (_isBreakTime ? _breakTime : _studyTime);

  _runTimer(int time) {
    if (_currentTime >= 0) {
      var currentTimeInMinutes = _currentTime ~/ 60;
      var currentTimeInSeconds = _currentTime % 60;
      _currentTime--;
      _currentTimeValue =
          '${currentTimeInMinutes.toString().padLeft(2, '0')}:${currentTimeInSeconds.toString().padLeft(2, '0')}';
      emit(UpdateTimerState(currentTimeValue, currentTime, isPlaying, session,
          maxTime, studyStatus));
    } else {
      _isBreakTime = !_isBreakTime;
      if (_isBreakTime) {
        if (_session < 4) {
          _currentTime = _breakTime;
        }
      } else if (_session < 4) {
        _currentTime = _studyTime;
        _session++;
      }
    }
  }

  void _startTimer() {
    if (!_isPlaying) {
      if (_studyTime < _currentTime) {
        _currentTime = _studyTime;
      }
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _runTimer(_currentTime);
      });
      _isPlaying = true;
    } else {
      _timer?.cancel();
      _isPlaying = false;
      emit(UpdateTimerState(currentTimeValue, currentTime, isPlaying, session,
          maxTime, studyStatus));
    }
  }

  void _skipTimer() {
    if (_isBreakTime) {
      _currentTime = _studyTime;
    } else {
      _currentTime = _breakTime;
    }
    _isBreakTime = !_isBreakTime;
  }

  void _resetTimer() {
    timer.cancel();
    _currentTime = maxTime;
    _currentTimeValue = _isBreakTime ? '05:00' : '25:00';
    _isPlaying = false;
    emit(UpdateTimerState(currentTimeValue, currentTime, isPlaying, session,
        maxTime, studyStatus));
  }

  void updateStudyTimer(int st) {
    _studyTime = st * 60;
    emit(UpdateTimerState(currentTimeValue, currentTime, isPlaying, session,
        maxTime, studyStatus));
  }

  void updateBreakTimer(int br) {
    _breakTime = br * 60;
    emit(UpdateTimerState(currentTimeValue, currentTime, isPlaying, session,
        maxTime, studyStatus));
  }

  void updateSessionTimer(int ss) {
    _sessionTime = ss * 60;
    emit(UpdateTimerState(currentTimeValue, currentTime, isPlaying, session,
        maxTime, studyStatus));
  }
}
