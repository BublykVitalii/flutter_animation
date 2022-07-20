import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

import 'package:flutter_animation/screens/med_online/screens/filter_screen/filter.dart';

// ---Texts---
const _kFilter = 'Фильтр';
const _kTitle = 'Врачи';

// ---Parameters---
const _kWidth = 14.0;

class DoctorAppBar extends StatelessWidget {
  const DoctorAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: const SizedBox(),
      leadingWidth: 0,
      title: Text(
        _kTitle,
        style: context.theme.textTheme.headline6!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(context, FilterScreen.route);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
            side: MaterialStateProperty.all(
              const BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          child: Text(
            _kFilter,
            style: context.theme.textTheme.button!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.accentColorMedical,
            ),
          ),
        ),
        const SizedBox(width: _kWidth),
      ],
    );
  }
}
