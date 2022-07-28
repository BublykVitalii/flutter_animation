import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Parameters---
const _kWidthHeightBox = 5.0;
const _kHeightWidthContainer = 40.0;
const _kHeightWidthIncrement = 30.0;

class Quantity extends StatelessWidget {
  const Quantity({
    Key? key,
    this.text,
    required this.isColumn,
  }) : super(key: key);

  final Widget? text;

  final bool isColumn;

  @override
  Widget build(BuildContext context) {
    const box = SizedBox(
      height: _kWidthHeightBox,
      width: _kWidthHeightBox,
    );
    return isColumn
        ? Column(children: contentWidgets(context))
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text ?? const Text(''),
              Row(
                children: [
                  DecrementIncrement(
                    onTap: () {},
                    icon: Icons.remove,
                  ),
                  box,
                  Container(
                    height: _kHeightWidthContainer,
                    width: _kHeightWidthContainer,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(_kWidthHeightBox),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '10',
                        style: context.theme.textTheme.subtitle2!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  box,
                  DecrementIncrement(
                    onTap: () {},
                    icon: Icons.add,
                  ),
                ],
              ),
            ],
          );
  }

  List<Widget> contentWidgets(BuildContext context) {
    const box = SizedBox(
      height: _kWidthHeightBox,
      width: _kWidthHeightBox,
    );
    return [
      text ?? const Text(''),
      DecrementIncrement(
        onTap: () {},
        icon: Icons.remove,
      ),
      box,
      Container(
        height: _kHeightWidthContainer,
        width: _kHeightWidthContainer,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(
            Radius.circular(_kWidthHeightBox),
          ),
        ),
        child: Center(
          child: Text(
            '10',
            style: context.theme.textTheme.subtitle2!.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
      box,
      DecrementIncrement(
        onTap: () {},
        icon: Icons.add,
      ),
    ];
  }
}

class DecrementIncrement extends StatelessWidget {
  const DecrementIncrement({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: _kHeightWidthIncrement,
        width: _kHeightWidthIncrement,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(
            Radius.circular(_kWidthHeightBox),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.grey,
        ),
      ),
    );
  }
}
