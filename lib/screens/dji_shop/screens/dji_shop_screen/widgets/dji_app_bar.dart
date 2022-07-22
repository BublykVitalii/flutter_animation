import 'package:flutter/material.dart';

class DjiAppBar extends StatelessWidget {
  const DjiAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),
      actions: const [
        Icon(Icons.shopping_cart_outlined),
        SizedBox(width: 15),
      ],
    );
  }
}
