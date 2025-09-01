import 'package:crypto_bazar_application_clean/core/theme/app_color.dart';
import 'package:flutter/widgets.dart';

class AppTextStyle {
  static const heading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.greyColor,
  );

  static const body = TextStyle(
    fontSize: 14,
    color: AppColors.greyColor,
  );

  static const priceUp = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.greenColor,
  );

  static const priceDown = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.redColor,
  );
}
