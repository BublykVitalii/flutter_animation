import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kFilter = 'Фильтр';
const _kReset = 'Сбросить';

// ---Parameters---
const _kWidth = 10.0;

class FilterAppBar extends StatelessWidget {
  const FilterAppBar({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        _kFilter,
        style: context.theme.textTheme.headline6!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: [
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Text(
              _kReset,
              style: context.theme.textTheme.button!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.accentColorMedical,
              ),
            ),
          ),
        ),
        const SizedBox(width: _kWidth),
      ],
    );
  }
}
