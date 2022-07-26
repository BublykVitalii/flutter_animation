import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Parameters---
const _kPadding = 15.0;

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key? key,
    required this.firstWord,
    required this.secondWord,
  }) : super(key: key);
  final String firstWord;
  final String secondWord;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: _kPadding,
        right: _kPadding,
        top: _kPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            firstWord,
            style: context.theme.textTheme.headline5!,
          ),
          Text(
            secondWord,
            style: context.theme.textTheme.headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
