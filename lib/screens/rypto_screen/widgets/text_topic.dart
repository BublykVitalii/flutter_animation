import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

class TextTopic extends StatelessWidget {
  const TextTopic({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Text(
        title,
        style: context.theme.textTheme.headline5!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
