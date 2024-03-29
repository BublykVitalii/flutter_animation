import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/dji_shop/domain/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/dji_shop.theme.dart';
import 'package:flutter_animation/screens/dji_shop/screens/cubit/product_cubit.dart';

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
        return BlocProvider(
          create: (context) => ProductCubit(),
          child: const DjiShopScreen(),
        );
      },
    );
  }

  const DjiShopScreen({Key? key}) : super(key: key);

  @override
  State<DjiShopScreen> createState() => _DjiShopScreenState();
}

class _DjiShopScreenState extends State<DjiShopScreen> {
  ProductCubit get productCubit => BlocProvider.of<ProductCubit>(context);

  @override
  void initState() {
    productCubit.getProducts();
    super.initState();
  }

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
      home: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.status == ProductStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.backgroundProductCard,
                color: Colors.white,
              ),
            );
          }
          return Scaffold(
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _getProductWidgets(state.products),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              heroTag: null,
              onPressed: () {},
              child: const Icon(Icons.home_outlined),
            ),
            bottomNavigationBar: const BottomBar(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }
}

Widget _getProductWidgets(List<Product>? products) {
  return products == null
      ? Container()
      : Row(
          children: products
              .map(
                (product) => ProductCard(product: product),
              )
              .toList());
}
