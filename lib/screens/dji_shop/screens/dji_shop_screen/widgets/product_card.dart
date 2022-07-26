import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';
import 'package:flutter_animation/screens/dji_shop/screens/product_screen/product_screen.dart';

// ---Parameters---
const _kPadding = 15.0;
const _kWidthHeight = 300.0;

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: _kPadding,
        right: _kPadding,
        top: _kPadding,
      ),
      scrollDirection: Axis.horizontal,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                width: _kWidthHeight,
                child: _CardProduct(),
              ),
              // SizedBox(
              //   width: _kWidthHeight,
              //   child: _CardProduct(),
              // ),
              // SizedBox(
              //   width: _kWidthHeight,
              //   child: _CardProduct(),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardProduct extends StatelessWidget {
  const _CardProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const nameProduct = Positioned(
      left: 15,
      top: 15,
      child: _CardText(
        firstWord: 'DJI',
        secondWord: 'Mavic 3',
      ),
    );
    final priceProduct = Positioned(
      right: 80,
      top: 15,
      child: Text(
        '\$ 2.049',
        style: context.theme.textTheme.subtitle1!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    final imageProduct = Positioned(
      top: 15,
      left: 25,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ProductScreen();
              },
            ),
          );
        },
        child: Hero(
          tag: 'productImage',
          child: Image.asset(
            AppImages.mavik3,
            height: 280,
            width: 280,
          ),
        ),
      ),
    );
    final addProduct = Positioned(
      bottom: 0,
      right: 61,
      child: InkWell(
        onTap: () {},
        overlayColor: MaterialStateProperty.all(AppColors.backgroundDji),
        child: Container(
          height: 50,
          width: 70,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.backgroundProductCard,
            size: 30,
          ),
        ),
      ),
    );
    final addFavorite = Positioned(
      bottom: 0,
      child: IconButton(
        splashColor: Colors.white,
        splashRadius: 5,
        icon: const Icon(
          Icons.favorite_outline,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
    return Stack(
      children: [
        Container(
          height: _kWidthHeight,
          width: 238,
          decoration: BoxDecoration(
            color: AppColors.backgroundProductCard,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        nameProduct,
        priceProduct,
        imageProduct,
        addProduct,
        addFavorite,
      ],
    );
  }
}

class _CardText extends StatelessWidget {
  const _CardText({
    Key? key,
    required this.firstWord,
    required this.secondWord,
  }) : super(key: key);
  final String firstWord;
  final String secondWord;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstWord,
          style:
              context.theme.textTheme.headline6!.copyWith(color: Colors.white),
        ),
        Text(
          secondWord,
          style: context.theme.textTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
