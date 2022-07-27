import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

import 'package:flutter_animation/screens/dji_shop/screens/product_screen/widgets/product_app_bar.dart';
import 'package:flutter_animation/screens/dji_shop/screens/product_screen/widgets/product_description.dart';
import 'package:flutter_animation/screens/dji_shop/screens/product_screen/widgets/slider_image.dart';
import 'package:flutter_animation/screens/dji_shop/screens/shopping_cart_screen/shopping_cart_screen.dart';

// ---Texts---
const _kBottom = 'Add To My Card';
// ---Parameters---
const _kFromHeight = 60.0;

class ProductScreen extends StatefulWidget {
  static const _routeName = '/product-screen';

  static PageRoute<ProductScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const ProductScreen();
      },
    );
  }

  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundProductCard,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(_kFromHeight),
        child: ProductAppBar(),
      ),
      body: Column(
        children: const [
          SliderImage(),
          ProductDescription(),
        ],
      ),
      bottomSheet: TextButton.icon(
        onPressed: () {
          Navigator.push(context, ShoppingCartScreen.route);
        },
        icon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        label: Text(
          _kBottom,
          style: context.theme.textTheme.headline6!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
