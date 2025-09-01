import 'package:crypto_bazar_application_clean/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
    fontFamily: 'mh',
    brightness: Brightness.dark,
    primaryColor: AppColors.greenColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
      foregroundColor: AppColors.whiteColor,
    ),
  );
}
