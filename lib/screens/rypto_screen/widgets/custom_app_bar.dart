import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kTitle = 'Rypto';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        _kTitle,
        style: context.theme.textTheme.headline6!.copyWith(),
      ),
      leading: Image.asset(AppImages.logo),
      actions: const [
        Icon(
          Icons.notification_add,
        ),
        SizedBox(width: 20),
        Icon(
          Icons.more_horiz,
        ),
        SizedBox(width: 20)
      ],
    );
  }
}
