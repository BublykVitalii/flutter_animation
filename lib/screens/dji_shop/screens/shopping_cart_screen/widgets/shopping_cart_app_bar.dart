import 'package:flutter/material.dart';

class ShoppingCartAppBar extends StatelessWidget {
  const ShoppingCartAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.delete,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
