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
    return Text(
      title,
      style: context.theme.textTheme.headline5!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
