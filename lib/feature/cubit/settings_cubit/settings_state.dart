part of 'settings_cubit.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class UpdateSettings extends SettingsState {
  final int studyDuration;
  final int breakDuration;
  final int sessions;

  const UpdateSettings(this.studyDuration, this.breakDuration, this.sessions);

  @override
  List<Object> get props => [studyDuration, breakDuration, sessions];
}
