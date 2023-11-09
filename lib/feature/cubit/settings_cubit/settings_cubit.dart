import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const UpdateSettings(2, 1, 1)) {
    loadSavedSettings();
  }

  late SharedPreferences _sharedPreferences;

  int _studyDuration = 2;
  int _breakDuration = 1;
  int _sessions = 1;

  int get studyDuration => _studyDuration;
  int get breakDuration => _breakDuration;
  int get sessions => _sessions;

  onChangedStudyDuration(double value) {
    _studyDuration = value.toInt();
    _sharedPreferences.setInt('study', _studyDuration);
    emit(UpdateSettings(studyDuration, breakDuration, sessions));
  }

  onChangedBreakDuration(double value) {
    _breakDuration = value.toInt();
    _sharedPreferences.setInt('break', _breakDuration);
    emit(UpdateSettings(studyDuration, breakDuration, sessions));
  }

  onChangedSessions(double value) {
    _sessions = value.toInt();
    _sharedPreferences.setInt('session', _sessions);
    emit(UpdateSettings(studyDuration, breakDuration, sessions));
  }

  loadSavedSettings() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _studyDuration = _sharedPreferences.getInt('study') ?? 2;
    _breakDuration = _sharedPreferences.getInt('break') ?? 1;
    _sessions = _sharedPreferences.getInt('session') ?? 1;
  }
}
