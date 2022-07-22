import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_colors.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kPopular = 'Popular';
const _kTopRated = 'Top rated';
const _kNewCollection = 'New collection';

// ---Parameters---
const _kWidth = 40.0;
const _kWidthContainer = 140.0;
const _kRadius = 20.0;
const _kPadding = 15.0;

class FilterProduct extends StatelessWidget {
  const FilterProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: _kPadding,
        right: _kPadding,
        top: _kPadding,
      ),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          _TextFilter(
            text: _kPopular,
            color: Colors.red,
            colorText: Colors.white,
          ),
          SizedBox(width: _kWidth),
          _TextFilter(
            text: _kTopRated,
            color: Colors.white,
            colorText: AppColors.iconDji,
          ),
          SizedBox(width: _kWidth),
          _TextFilter(
            text: _kNewCollection,
            color: Colors.white,
            colorText: AppColors.iconDji,
          ),
          SizedBox(width: _kWidth),
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
    return Container(
      height: _kWidth,
      width: _kWidthContainer,
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
    );
  }
}
