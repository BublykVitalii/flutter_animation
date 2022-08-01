import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_animation/screens/dji_shop/domain/product.dart';

class SliderImage extends StatefulWidget {
  const SliderImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.product.imageProduct
        .map(
          (image) => SizedBox(
            width: 400,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
    final carousel = Expanded(
      child: CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
      ),
    );
    return Flexible(
      child: Hero(
        tag: 'productImage',
        child: Column(
          children: [
            carousel,
            ImageList(
              controller: _controller,
              current: _current,
              product: widget.product,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageList extends StatelessWidget {
  const ImageList({
    Key? key,
    required this.product,
    required CarouselController controller,
    required int current,
  })  : _controller = controller,
        _current = current,
        super(key: key);

  final CarouselController _controller;
  final int _current;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: product.imageProduct.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                  .withOpacity(_current == entry.key ? 1 : 0.4),
            ),
          ),
        );
      }).toList(),
    );
  }
}
