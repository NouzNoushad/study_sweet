part of 'timer_cubit.dart';

sealed class TimerState extends Equatable {
  const TimerState();

  @override
  List<Object> get props => [];
}

final class TimerInitial extends TimerState {}

class UpdateTimerState extends TimerState {
  const UpdateTimerState();

  @override
  List<Object> get props => [];
}

class DisplayTimerState extends TimerState {
  final String displayTime;
  const DisplayTimerState(this.displayTime);

  @override
  List<Object> get props => [displayTime];
}
