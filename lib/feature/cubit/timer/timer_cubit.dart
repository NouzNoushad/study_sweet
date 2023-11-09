import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promodoro_app/feature/cubit/settings_cubit/settings_cubit.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit({required SettingsCubit settingsCubit})
      : _settingsCubit = settingsCubit,
        super(
            const UpdateTimerState('02:00', 2 * 60, false, 1, 2 * 60, 'Study'));
  final SettingsCubit _settingsCubit;

  Timer? _timer;
  bool _isPlaying = false;
  bool _isBreakTime = false;
  int _currentTime = 2 * 60;
  int _studyTime = 2 * 60;
  int _breakTime = 1 * 60;
  int _sessionTime = 1 * 60;
  String _currentTimeValue = '02:00';
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
    print('study: $_studyTime, current: $_currentTime');
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
    _currentTime = _studyTime;
    if (!_isPlaying) {
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
    print('/////////reset Timer, ${_settingsCubit.studyDuration}');
    _currentTime = maxTime;
    _currentTimeValue = _currentTimeValue;
    emit(UpdateTimerState(currentTimeValue, currentTime, isPlaying, session,
        maxTime, studyStatus));
  }

  void updateStudyTimer(int st) {
    _studyTime = st * 60;
    print('cur: ;::: $_studyTime');
    emit(UpdateTimerState(currentTimeValue, currentTime, isPlaying, session,
        maxTime, studyStatus));
  }

  void updateBreakTimer(int br) {
    _breakTime = br * 60;
    print('br: ;::: $_breakTime');
    emit(UpdateTimerState(currentTimeValue, currentTime, isPlaying, session,
        maxTime, studyStatus));
  }

  void updateSessionTimer(int ss) {
    _sessionTime = ss * 60;
    print('ss: ;::: $_sessionTime');
    emit(UpdateTimerState(currentTimeValue, currentTime, isPlaying, session,
        maxTime, studyStatus));
  }
}
