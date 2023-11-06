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
  const UpdateTimerState(
      this.currentTimeValue, this.currentTime, this.isPlaying, this.session);

  @override
  List<Object> get props => [currentTimeValue, currentTime, isPlaying, session];
}
