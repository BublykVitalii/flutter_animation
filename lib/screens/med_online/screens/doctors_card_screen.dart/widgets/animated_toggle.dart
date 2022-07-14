import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kList = 'Список';
const _kMap = 'Карта';

class AnimatedToggle extends StatefulWidget {
  const AnimatedToggle({
    Key? key,
  }) : super(key: key);
  @override
  AnimatedToggleState createState() => AnimatedToggleState();
}

class AnimatedToggleState extends State<AnimatedToggle> {
  final List<bool> _selections = [true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ToggleButtons(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < _selections.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                _selections[buttonIndex] = true;
              } else {
                _selections[buttonIndex] = false;
              }
            }
          });
        },
        isSelected: _selections,
        children: const [
          _ButtonTabs(nameButton: _kList),
          _ButtonTabs(nameButton: _kMap),
        ],
      ),
    );
  }
}

class _ButtonTabs extends StatelessWidget {
  const _ButtonTabs({
    Key? key,
    required this.nameButton,
  }) : super(key: key);

  final String nameButton;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 40,
      child: Center(
        child: Text(
          nameButton,
          style: context.theme.textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
