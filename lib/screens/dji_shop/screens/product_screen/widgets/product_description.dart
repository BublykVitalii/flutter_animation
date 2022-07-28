import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/dji_shop/screens/shopping_cart_screen/widgets/quantity.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Parameters---
const _kRadius = Radius.circular(40);
const _kPadding = 20.0;

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: _kRadius,
            topRight: _kRadius,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(_kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _ProductName(productName: 'DJI Mavik 3'),
              const SizedBox(height: 5),
              const _RatingReviewPrice(
                rating: 3.0,
                review: '56 Reviews',
                price: '\$ 2.049',
              ),
              const SizedBox(height: 10),
              const _DescriptionProduct(
                  description:
                      'Capture stunning imagery with a legendary Hasselblad camera and enjoy smooth flight with omnidirectional obstacle sensing. Every improvement on Mavic 3 sets a higher standard for aerial photography. Fly with Mavic 3 and discover imaging above everything.'),
              const SizedBox(height: 10),
              Quantity(
                text: Text(
                  'Quantity',
                  style: context.theme.textTheme.subtitle1!.copyWith(
                    color: Colors.grey,
                  ),
                ),
                isColumn: false,
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductName extends StatelessWidget {
  const _ProductName({
    Key? key,
    required this.productName,
  }) : super(key: key);
  final String productName;
  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      style: context.theme.textTheme.headline5!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _RatingReviewPrice extends StatelessWidget {
  const _RatingReviewPrice({
    Key? key,
    required this.review,
    required this.price,
    required this.rating,
  }) : super(key: key);

  final String review;
  final String price;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            RatingBar.builder(
              itemSize: 20,
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            const SizedBox(width: 5),
            Text(
              review,
              style: context.theme.textTheme.button!.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Text(
          price,
          style: context.theme.textTheme.headline6!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _DescriptionProduct extends StatelessWidget {
  const _DescriptionProduct({
    Key? key,
    required this.description,
  }) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: context.theme.textTheme.subtitle1!.copyWith(
        color: Colors.black,
        height: 1.5,
      ),
    );
  }
}
