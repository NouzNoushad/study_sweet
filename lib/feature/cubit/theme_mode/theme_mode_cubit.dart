import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(const ThemeChangedState(true));

  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  switchThemeMode() {
    _isDarkMode = !_isDarkMode;
    emit(ThemeChangedState(_isDarkMode));
  }
}
