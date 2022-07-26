import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/screens/dji_shop/screens/shopping_cart_screen/shopping_cart_screen.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundProductCard,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, ShoppingCartScreen.route);
          },
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
