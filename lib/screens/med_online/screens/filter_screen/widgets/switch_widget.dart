import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kChildrenSpecialist = 'Детский специалист';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _kChildrenSpecialist,
            style: context.theme.textTheme.subtitle1!,
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
