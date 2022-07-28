import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

class NameAndPrice extends StatelessWidget {
  const NameAndPrice({
    Key? key,
    required this.nameProduct,
    required this.price,
  }) : super(key: key);

  final String nameProduct;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameProduct,
          style: context.theme.textTheme.headline6!,
        ),
        const SizedBox(height: 10),
        Text(
          price,
          style: context.theme.textTheme.headline6!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
