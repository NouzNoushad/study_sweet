part of 'settings_cubit.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class UpdateSettings extends SettingsState {
  final double studyDuration;
  final double breakDuration;
  final double sessions;

  const UpdateSettings(this.studyDuration, this.breakDuration, this.sessions);

  @override
  List<Object> get props => [studyDuration, breakDuration, sessions];
}
