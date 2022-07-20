import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

class DropdownButtonFilter extends StatelessWidget {
  const DropdownButtonFilter({
    Key? key,
    required this.title,
    required this.titleButton,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String titleButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: context.theme.textTheme.subtitle1!,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    titleButton,
                    overflow: TextOverflow.ellipsis,
                    style: context.theme.textTheme.subtitle1!,
                    textWidthBasis: TextWidthBasis.longestLine,
                  ),
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
