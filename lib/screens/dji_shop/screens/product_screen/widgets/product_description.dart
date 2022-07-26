import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 20.0,
            right: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _ProductName(productName: 'DJI Mavik 3'),
              SizedBox(height: 5),
              _RatingReviewPrice(
                rating: 3.0,
                review: '56 Reviews',
                price: '\$ 2.049',
              ),
              SizedBox(height: 10),
              _DescriptionProduct(
                  description:
                      'Capture stunning imagery with a legendary Hasselblad camera and enjoy smooth flight with omnidirectional obstacle sensing. Every improvement on Mavic 3 sets a higher standard for aerial photography. Fly with Mavic 3 and discover imaging above everything.'),
              SizedBox(height: 10),
              _Quantity(),
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

class _Quantity extends StatelessWidget {
  const _Quantity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Quantity',
          style: context.theme.textTheme.subtitle1!.copyWith(
            color: Colors.grey,
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: const Icon(
                  Icons.remove,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Center(
                child: Text(
                  '10',
                  style: context.theme.textTheme.subtitle2!.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
