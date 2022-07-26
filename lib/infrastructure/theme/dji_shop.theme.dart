import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_colors.dart';

const _colorTheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.accentColorMedical,
  onPrimary: Colors.black87,
  secondary: Colors.black,
  onSecondary: Colors.black,
  error: AppColors.backgroundProductCard,
  onError: AppColors.backgroundProductCard,
  background: AppColors.backgroundProductCard,
  onBackground: AppColors.backgroundDji,
  surface: AppColors.backgroundProductCard,
  onSurface: Colors.white,
);

Color _getCheckboxCheckedColor(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    return Colors.white;
  }
  return Colors.grey;
}

Color _getCheckboxFillColor(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    return AppColors.accentColorMedical;
  }
  return AppColors.accentColorMedical;
}

Color _getSwitchTrackColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return AppColors.accentColorMedical;
  } else if (states.contains(MaterialState.selected)) {
    return AppColors.accentColorMedical;
  }
  return Colors.grey.shade400;
}

Color _getSwitchThumbColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return Colors.grey.shade400;
  } else if (states.contains(MaterialState.selected)) {
    return Colors.white;
  }

  return Colors.white;
}

Color _getRadioFillColor(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    return Colors.black;
  }
  return Colors.grey;
}

BorderSide _getOutlinedColor(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    return const BorderSide(color: Colors.white);
  }
  return const BorderSide(color: Colors.white);
}

ThemeData getDjiTheme(BuildContext context) {
  final textTheme =
      Typography.material2018(platform: defaultTargetPlatform).black;

  final buttonScaledPadding = ButtonStyleButton.scaledPadding(
    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
  );

  final textButtonScaledPadding = ButtonStyleButton.scaledPadding(
    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
  );

  return ThemeData.from(
    colorScheme: _colorTheme,
    textTheme: textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
      decorationColor: Colors.black,
    ),
  ).copyWith(
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.backgroundDji,
      centerTitle: true,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: textButtonScaledPadding,
      ).copyWith(
        backgroundColor:
            MaterialStateProperty.all(AppColors.backgroundProductCard),
        minimumSize: MaterialStateProperty.all(
          const Size(
            double.maxFinite,
            80,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
        side: MaterialStateProperty.resolveWith(_getOutlinedColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shadowColor: MaterialStateProperty.all(AppColors.backgroundDji),
        foregroundColor: MaterialStateProperty.all(AppColors.iconDji),
        fixedSize: MaterialStateProperty.all(const Size.fromHeight(60)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.backgroundProductCard,
      foregroundColor: Colors.white,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        padding: buttonScaledPadding,
      ).copyWith(
        side: MaterialStateProperty.resolveWith(_getOutlinedColor),
      ),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((_getCheckboxFillColor)),
      checkColor: MaterialStateProperty.resolveWith(_getCheckboxCheckedColor),
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith(_getSwitchTrackColor),
      thumbColor: MaterialStateProperty.resolveWith(_getSwitchThumbColor),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(_getRadioFillColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(
        color: Colors.black,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      fillColor: AppColors.accentColorMedical,
      splashColor: AppColors.accentColorMedical,
      borderColor: Colors.grey.shade200,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),
  );
}
