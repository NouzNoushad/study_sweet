part of 'theme_mode_cubit.dart';

sealed class ThemeModeState extends Equatable {
  const ThemeModeState();

  @override
  List<Object> get props => [];
}

class ThemeChangedState extends ThemeModeState {
  final bool isDarkMode;
  const ThemeChangedState(this.isDarkMode);

  @override
  List<Object> get props => [isDarkMode];
}
