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
      backgroundColor: Colors.white,
      title: Text(
        _kTitle,
        style: context.theme.textTheme.headline6!.copyWith(
          color: Colors.black,
        ),
      ),
      leading: Image.asset(AppImages.logo),
      actions: const [
        Icon(
          Icons.notification_add,
          color: Colors.black,
        ),
        SizedBox(width: 20),
        Icon(
          Icons.more_horiz,
          color: Colors.black,
        ),
        SizedBox(width: 20)
      ],
    );
  }
}
