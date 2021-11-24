import 'package:flutter/material.dart';
import 'bored_colors.dart';

class BoredTheme with ChangeNotifier {
  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get boredLightTheme {
    return ThemeData(
      primaryColor: BoredColors.primaryColorLight,
      secondaryHeaderColor: BoredColors.accentColorLight,
      scaffoldBackgroundColor: BoredColors.backgroundColorLight,
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: BoredColors.onSurfaceColorLight),
      ),
    );
  }

  static ThemeData get boredDarkTheme {
    return ThemeData(
      primaryColor: BoredColors.primaryColorDark,
      secondaryHeaderColor: BoredColors.accentColorDark,
      scaffoldBackgroundColor: BoredColors.backgroundColorDark,
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: BoredColors.onSurfaceColorDark),
      ),
    );
  }
}
