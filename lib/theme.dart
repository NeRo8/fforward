import 'package:flutter/material.dart';

import 'resources/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'Menlo',
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: AppColors.primaryColor,
          ),
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w100,
          ),
          titleMedium: TextStyle(
            color: AppColors.textColor,
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primaryColor,
          selectionColor: AppColors.primaryColor.withOpacity(0.5),
        ),
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            Color color = AppColors.secondaryColor;

            if (states.contains(MaterialState.error)) {
              color = AppColors.errorColor;
            } else if (states.contains(MaterialState.focused)) {
              color = AppColors.primaryColor;
            }

            return TextStyle(color: color, letterSpacing: 1.3);
          }),
          floatingLabelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            Color color = AppColors.secondaryColor;

            if (states.contains(MaterialState.error)) {
              color = AppColors.errorColor;
            } else if (states.contains(MaterialState.focused)) {
              color = AppColors.primaryColor;
            }

            return TextStyle(color: color, letterSpacing: 1.3);
          }),
          hintStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            Color color = AppColors.secondaryColor;

            if (states.contains(MaterialState.error)) {
              color = AppColors.errorColor;
            }

            return TextStyle(
                color: color, letterSpacing: 1.1, fontWeight: FontWeight.w200);
          }),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.errorColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.errorColor),
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: AppColors.secondaryColor,
        ),
      );
}
