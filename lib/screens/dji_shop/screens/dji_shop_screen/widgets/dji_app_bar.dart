import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/dji_shop/screens/shopping_cart_screen/shopping_cart_screen.dart';

class DjiAppBar extends StatelessWidget {
  const DjiAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            Navigator.push(context, ShoppingCartScreen.getRoute());
          },
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
