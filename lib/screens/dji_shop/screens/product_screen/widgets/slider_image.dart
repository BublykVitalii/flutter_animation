import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_images.dart';

class SliderImage extends StatefulWidget {
  const SliderImage({Key? key}) : super(key: key);

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = _imgList
        .map(
          (item) => SizedBox(
            width: 400,
            child: Image.asset(
              item,
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
    required CarouselController controller,
    required int current,
  })  : _controller = controller,
        _current = current,
        super(key: key);

  final CarouselController _controller;
  final int _current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _imgList.asMap().entries.map((entry) {
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

final List<String> _imgList = [
  AppImages.mavik3,
  AppImages.mavik3,
  AppImages.mavik3
];
