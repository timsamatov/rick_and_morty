import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/theme/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = true;

  ThemeData get theme => isDarkTheme ? darkTheme : lightTheme;

  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBgColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBgColor,
    ),
   secondaryHeaderColor: AppColors.tfBgColor

  );

  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBgColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBgColor,
    ),
   secondaryHeaderColor: AppColors.tfBgColorWhite
  );

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
