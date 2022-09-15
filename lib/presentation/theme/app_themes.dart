import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryDarkColor,
    onPrimary: AppColors.primaryDarkColor,
    secondary: AppColors.black,
    onSecondary: AppColors.black,
    error: Colors.red,
    onError: Colors.red,
    background: AppColors.white,
    onBackground: AppColors.white,
    surface: Colors.black26,
    onSurface: Colors.black26,
  ),
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: AppColors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: AppColors.primaryDarkColor,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: AppColors.primaryDarkColor),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: AppColors.grey,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedIconTheme: IconThemeData(size: 28),
    backgroundColor: AppColors.white,
    elevation: 0.0,
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(50.0),
      color: AppColors.primaryColor,
    ),
    unselectedLabelColor: AppColors.grey,
  ),
  textTheme: TextTheme(
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.grey,
    ),
    labelSmall: TextStyle(
      fontSize: 16,
      color: AppColors.black,
    ),
  ),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    onPrimary: AppColors.black,
    secondary: AppColors.white,
    onSecondary: AppColors.white,
    error: Colors.red,
    onError: Colors.red,
    background: AppColors.darkBGColor,
    onBackground: AppColors.darkBGColor,
    surface: Colors.black54,
    onSurface: Colors.black54,
  ),
  scaffoldBackgroundColor: Color(0xFF333739),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.darkBGColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: AppColors.darkBGColor,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: ThemeData().scaffoldBackgroundColor),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.lightBlue,
    unselectedItemColor: AppColors.grey,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    backgroundColor: AppColors.darkBGColor,
    elevation: 0.0,
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(50.0),
      color: AppColors.lightBlue,
    ),
    unselectedLabelColor: AppColors.grey,
  ),
  textTheme: TextTheme(
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.darkGray,
    ),
    labelSmall: TextStyle(
      fontSize: 16,
      color: AppColors.white,
    ),
  ),
);
