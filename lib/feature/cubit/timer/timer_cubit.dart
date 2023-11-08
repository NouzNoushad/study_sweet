import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promodoro_app/feature/cubit/settings_cubit/settings_cubit.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit({required SettingsCubit settingsCubit})
      : _settingsCubit = settingsCubit,
        super(UpdateTimerState(
            '02:00',
            (settingsCubit.studyDuration * 60).round(),
            false,
            1,
            settingsCubit.studyDuration.round(),
            'Study'));
  final SettingsCubit _settingsCubit;

  Timer? _timer;
  bool _isPlaying = false;
  bool _isBreakTime = false;
  int _currentTime = 1 * 60;
  int _progressTime = 1;
  String _currentTimeValue = '02:00';
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
    print('study: ${(_settingsCubit.studyDuration * 60).round()}');
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
          _currentTime = (_settingsCubit.breakDuration * 60).round();
          _progressTime = _settingsCubit.breakDuration.round();
        }
      } else if (_session < 4) {
        _currentTime = (_settingsCubit.studyDuration * 60).round();
        _progressTime = _settingsCubit.studyDuration.round();
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
