import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/dji_shop.theme.dart';
import 'package:flutter_animation/screens/dji_shop/screens/dji_shop_screen/widgets/bottom_bar.dart';

import 'package:flutter_animation/screens/dji_shop/screens/dji_shop_screen/widgets/dji_app_bar.dart';
import 'package:flutter_animation/screens/dji_shop/screens/dji_shop_screen/widgets/filter_product.dart';
import 'package:flutter_animation/screens/dji_shop/screens/dji_shop_screen/widgets/header_text.dart';
import 'package:flutter_animation/screens/dji_shop/screens/dji_shop_screen/widgets/product_card.dart';

// ---Texts---
const _kOur = 'Our';
const _kProducts = 'Products';

// ---Parameters---
const _kFromHeight = 60.0;
const _kHeight = 20.0;

class DjiShopScreen extends StatefulWidget {
  static const _routeName = '/dji-shop-screen';

  static PageRoute<DjiShopScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const DjiShopScreen();
      },
    );
  }

  const DjiShopScreen({Key? key}) : super(key: key);

  @override
  State<DjiShopScreen> createState() => _DjiShopScreenState();
}

class _DjiShopScreenState extends State<DjiShopScreen> {
  @override
  Widget build(BuildContext context) {
    final textAndButton = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(
          firstWord: _kOur,
          secondWord: _kProducts,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Icon(
            Icons.search,
          ),
        ),
      ],
    );
    return MaterialApp(
      theme: getDjiTheme(context),
      home: Scaffold(
        backgroundColor: AppColors.backgroundDji,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(_kFromHeight),
          child: DjiAppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textAndButton,
              const SizedBox(height: _kHeight),
              FilterProduct(),
              const SizedBox(height: _kHeight),
              ProductCard(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {},
          child: const Icon(Icons.home_outlined),
        ),
        bottomNavigationBar: const BottomBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
