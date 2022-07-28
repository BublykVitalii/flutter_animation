import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_colors.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kPopular = 'Popular';
const _kTopRated = 'Top rated';
const _kNewCollection = 'New collection';

// ---Parameters---
const _kHeight = 60.0;
const _kViewportFraction = 0.4;
const _kRadius = 20.0;
const _kPadding = 10.0;

class FilterProduct extends StatelessWidget {
  FilterProduct({
    Key? key,
  }) : super(key: key);
  final PageController controller = PageController(
    viewportFraction: _kViewportFraction,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _kHeight,
      child: PageView(
        controller: controller,
        padEnds: false,
        children: const [
          _TextFilter(
            text: _kPopular,
            color: AppColors.backgroundProductCard,
            colorText: Colors.white,
          ),
          _TextFilter(
            text: _kTopRated,
            color: Colors.white,
            colorText: AppColors.iconDji,
          ),
          _TextFilter(
            text: _kNewCollection,
            color: Colors.white,
            colorText: AppColors.iconDji,
          ),
        ],
      ),
    );
  }
}

class _TextFilter extends StatelessWidget {
  const _TextFilter({
    Key? key,
    required this.text,
    required this.color,
    required this.colorText,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color colorText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_kPadding),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(_kRadius),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: context.theme.textTheme.subtitle1!.copyWith(
              color: colorText,
            ),
          ),
        ),
      ),
    );
  }
}
