import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const UpdateSettings(10, 10, 10));

  double _studyDuration = 10;
  double _breakDuration = 10;
  double _sessions = 10;

  double get studyDuration => _studyDuration;
  double get breakDuration => _breakDuration;
  double get sessions => _sessions;

  onChangedStudyDuration(double value) {
    _studyDuration = value;
    emit(UpdateSettings(studyDuration, breakDuration, sessions));
  }

  onChangedBreakDuration(double value) {
    _breakDuration = value;
    emit(UpdateSettings(studyDuration, breakDuration, sessions));
  }

  onChangedSessions(double value) {
    _sessions = value;
    emit(UpdateSettings(studyDuration, breakDuration, sessions));
  }
}
