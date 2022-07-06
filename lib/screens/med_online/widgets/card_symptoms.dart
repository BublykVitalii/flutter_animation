import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kCold = 'Простуда';
const _kAllergies = 'Аллергия';
const _kPregnancy = 'Беременность';

const _kToothache = 'Зубные боли';
const _kDepression = 'Депрессия';
const _kHeartProblems = 'Сердечные проблемы';

const _kWoomensPain = 'Женские боли';
const _kComputerTired = 'Усталось';
const _kRash = 'Сыпь';

// ---Parameters---
const _kHeight = 10.0;
const _kHeightImage = 100.0;
const _kWidthImage = 110.0;
const _kWidth = 100.0;

class CardSymptoms extends StatelessWidget {
  const CardSymptoms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _Card(image: AppImages.cold, text: _kCold),
            _Card(image: AppImages.allergies, text: _kAllergies),
            _Card(image: AppImages.pregnancy, text: _kPregnancy),
          ],
        ),
        const SizedBox(height: _kHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _Card(image: AppImages.toothache, text: _kToothache),
            _Card(image: AppImages.depression, text: _kDepression),
            _Card(image: AppImages.heartProblems, text: _kHeartProblems),
          ],
        ),
        const SizedBox(height: _kHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _Card(image: AppImages.woomensPain, text: _kWoomensPain),
            _Card(image: AppImages.computerTired, text: _kComputerTired),
            _Card(image: AppImages.rash, text: _kRash),
          ],
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
          height: _kHeightImage,
          width: _kWidthImage,
          image: Image.asset(
            image,
          ).image,
        ),
        SizedBox(
          width: _kWidth,
          child: Text(
            text,
            style: context.theme.textTheme.subtitle1!.copyWith(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
