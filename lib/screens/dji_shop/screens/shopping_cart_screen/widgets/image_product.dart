import 'package:flutter/material.dart';

// ---Parameters---
const _kHeightWidth = 180.0;
const _kBottomHeight = 60.0;
const _kRadius = 40.0;
const _kHeight = 150.0;
const _kWidth = 150.0;

class ImageProduct extends StatelessWidget {
  const ImageProduct({
    Key? key,
    required this.colors,
    required this.index,
    required this.image,
  }) : super(key: key);

  final List colors;
  final int index;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _kHeight,
      width: _kHeightWidth,
      child: Stack(
        children: [
          Positioned(
            bottom: _kBottomHeight,
            child: Container(
              height: _kBottomHeight,
              width: _kWidth,
              decoration: BoxDecoration(
                color: colors[index],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(_kRadius),
                  bottomRight: Radius.circular(_kRadius),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 15,
            child: SizedBox(
              height: 200,
              width: _kHeightWidth,
              child: Image.asset(image),
            ),
          ),
        ],
      ),
    );
  }
}
