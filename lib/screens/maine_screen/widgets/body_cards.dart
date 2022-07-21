import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/app_colors.dart';

// ---Parameters---
const double _kHeight = 30;
const double _kFontSize = 15;
const double _kPaddingLeftRight = 20;

class BodyCards extends StatelessWidget {
  const BodyCards({
    Key? key,
    required this.title,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.maxFinite,
      child: InkWell(
        onTap: onTap,
        child: Ink.image(
          image: Image.asset(
            image,
          ).image,
          fit: BoxFit.cover,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Ink(
              color: AppColors.backgroundButtonAction,
              child: Container(
                padding: const EdgeInsets.only(
                  left: _kPaddingLeftRight,
                  right: _kPaddingLeftRight,
                ),
                alignment: Alignment.center,
                height: _kHeight,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: _kFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
