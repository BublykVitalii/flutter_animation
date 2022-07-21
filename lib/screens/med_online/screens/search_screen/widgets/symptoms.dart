import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_colors.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kSymptoms = 'Симптомы';
const _kAll = 'Все';

class Symptoms extends StatelessWidget {
  const Symptoms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _kSymptoms,
          style: context.theme.textTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          _kAll,
          style: context.theme.textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.accentColorMedical,
          ),
        ),
      ],
    );
  }
}
