
import 'package:ecoseva_app/common/colors.dart';
import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';

class EcoSewaTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
        primaryColor: AppColors.parrotGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: FontFamily.clashDisplay,
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.parrotGreen,
          indicatorColor: Colors.transparent,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ));
  }
}
