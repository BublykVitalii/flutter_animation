import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

import 'package:flutter_animation/screens/dji_shop/screens/dji_shop_screen/widgets/header_text.dart';
import 'package:flutter_animation/screens/dji_shop/screens/shopping_cart_screen/widgets/image_product.dart';
import 'package:flutter_animation/screens/dji_shop/screens/shopping_cart_screen/widgets/name_and_price.dart';
import 'package:flutter_animation/screens/dji_shop/screens/shopping_cart_screen/widgets/quantity.dart';
import 'package:flutter_animation/screens/dji_shop/screens/shopping_cart_screen/widgets/shopping_cart_app_bar.dart';

// ---Texts---
const _kShopping = 'Shopping';
const _kCart = 'Cart';

// ---Parameters---
const _kFromHeight = 60.0;

class ShoppingCartScreen extends StatefulWidget {
  static const _routeName = '/shopping-cart-screen';

  static PageRoute<ShoppingCartScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const ShoppingCartScreen();
      },
    );
  }

  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blueAccent,
  ];
  Random random = Random();

  int index = 0;

  void changeIndex() {
    setState(() => index = random.nextInt(3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDji,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(_kFromHeight),
        child: ShoppingCartAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderText(
            firstWord: _kShopping,
            secondWord: _kCart,
          ),
          const SizedBox(height: 40),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: 4,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageProduct(
                      colors: colors,
                      index: index,
                      image: AppImages.mavik3,
                    ),
                    const NameAndPrice(
                      nameProduct: 'DJI Mavik 3',
                      price: '\$ 2.049',
                    ),
                    const Quantity(),
                    const SizedBox(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomSheet: TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        label: Text(
          'Proceed to checkout',
          style: context.theme.textTheme.headline6!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
