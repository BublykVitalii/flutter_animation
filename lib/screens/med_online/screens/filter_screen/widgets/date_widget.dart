import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kDate = 'Дата приема';

class DateWidget extends StatelessWidget {
  const DateWidget({
    Key? key,
    required this.onPressed,
    required this.date,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(_kDate, style: context.theme.textTheme.subtitle1!),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: onPressed,
          child: Text(
            date,
            style: context.theme.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.accentColorMedical,
            ),
          ),
        ),
      ],
    );
  }
}
