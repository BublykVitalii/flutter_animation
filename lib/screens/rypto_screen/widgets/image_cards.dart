import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

class ImageCards extends StatefulWidget {
  const ImageCards({Key? key}) : super(key: key);

  @override
  State<ImageCards> createState() => _ImageCardsState();
}

class _ImageCardsState extends State<ImageCards> {
  late PageController _pageController;
  final int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  final List<String> listCard = [
    AppImages.face,
    AppImages.people,
    AppImages.artTwo,
    AppImages.artFri,
    AppImages.artFour,
    AppImages.artFive,
    AppImages.artSicks,
    AppImages.artSeven,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 0.85,
          child: PageView.builder(
              itemCount: listCard.length,
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              itemBuilder: (context, index) {
                return carouselView(listCard[index], index);
              }),
        )
      ],
    );
  }

  Widget carouselView(String image, int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(image),
        );
      },
    );
  }

  Widget carouselCard(String image) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.fill,
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black26,
                )
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: Prise(),
          ),
        ],
      ),
    );
  }
}

class Prise extends StatelessWidget {
  const Prise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 242, 241, 241),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Rypto Artwork',
              overflow: TextOverflow.ellipsis,
              style: context.theme.textTheme.subtitle1!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Current Bid',
              style: context.theme.textTheme.caption!.copyWith(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '1.35 ETH',
              style: context.theme.textTheme.subtitle1!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '\$2.485.11',
              style: context.theme.textTheme.caption!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Container(
                height: 30,
                width: 120,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        AppImages.ethLogo,
                        scale: 1.5,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Place a bid',
                      style: context.theme.textTheme.caption!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
