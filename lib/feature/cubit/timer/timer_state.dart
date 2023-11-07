part of 'timer_cubit.dart';

sealed class TimerState extends Equatable {
  const TimerState();

  @override
  List<Object> get props => [];
}

class UpdateTimerState extends TimerState {
  final String currentTimeValue;
  final int currentTime;
  final bool isPlaying;
  final int session;
  final int progressTime;
  final String studyStatus;
  const UpdateTimerState(this.currentTimeValue, this.currentTime,
      this.isPlaying, this.session, this.progressTime, this.studyStatus);

  @override
  List<Object> get props => [
        currentTimeValue,
        currentTime,
        isPlaying,
        session,
        progressTime,
        studyStatus
      ];
}
