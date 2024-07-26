import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';

class AppTheme  {
  final ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.white.withOpacity(0.97),
    textTheme: TextTheme(
        titleSmall: TextStyle(
          color: AppColors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14
        ),
        titleLarge: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24
        ),
        displayMedium: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600
        ),
        displayLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.black
        )
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white.withOpacity(0.97),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.grey),
      trackColor: MaterialStateProperty.all(AppColors.white),
    ),
  );
  final ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.dark,
    textTheme  :TextTheme(
        titleSmall: TextStyle(
          color: AppColors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14
        ),
        titleLarge: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24
        ),
        displayMedium: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600
        ),
        displayLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19,
            color: AppColors.white
        )
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.dark,
    ),
    switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(AppColors.white),
        trackColor: MaterialStateProperty.all(AppColors.blueLight)
    ),
  );
}