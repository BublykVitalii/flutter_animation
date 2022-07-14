import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kMedCentre = 'Медцентры';
const _kDoctors = 'Врачи';

// ---Parameters---
const _kHeight = 150.0;
const _kWidth = 170.0;

class CardMedCenterDoctors extends StatelessWidget {
  const CardMedCenterDoctors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: const _Card(
            image: AppImages.medCentre,
            text: _kMedCentre,
          ),
        ),
        InkWell(
          onTap: () {},
          child: const _Card(
            image: AppImages.doctors,
            text: _kDoctors,
          ),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Ink.image(
          height: _kHeight,
          width: _kWidth,
          image: Image.asset(
            image,
          ).image,
        ),
        Text(
          text,
          style: context.theme.textTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
