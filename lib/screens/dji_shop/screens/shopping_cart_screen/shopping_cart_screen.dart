import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/screens/dji_shop/screens/dji_shop_screen/widgets/header_text.dart';
import 'package:flutter_animation/screens/dji_shop/screens/shopping_cart_screen/widgets/shopping_cart_app_bar.dart';

// ---Texts---

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
            firstWord: 'Shopping',
            secondWord: 'Cart',
          ),
          const SizedBox(height: 40),
          Stack(
            children: [
              Container(
                height: 110,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Positioned(
                left: 100,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(AppImages.mavik3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
