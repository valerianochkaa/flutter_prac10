import 'package:flutter_bloc/flutter_bloc.dart';
enum AppTheme { light, dark, beige }

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(AppTheme.light); // Начальное состояние — светлая тема

  void toggleTheme() {
    if (state == AppTheme.light) {
      emit(AppTheme.dark); // Переключаем на темную тему
    } else if (state == AppTheme.dark) {
      emit(AppTheme.beige); // Переключаем на бежевую тему
    } else {
      emit(AppTheme.light); // Возвращаемся к светлой теме
    }
  }
}
