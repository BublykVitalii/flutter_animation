import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

class Sellers extends StatelessWidget {
  const Sellers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20.0),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              People(
                name: 'Bond',
                money: '20.354 ETH',
              ),
              SizedBox(width: 20),
              Pransky(),
              SizedBox(width: 20),
              People(
                name: 'Bull will',
                money: '17.354 ETH',
              ),
              SizedBox(width: 20),
              People(
                name: 'Bull will',
                money: '17.354 ETH',
              ),
              SizedBox(width: 20),
              People(
                name: 'Bull will',
                money: '17.354 ETH',
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              People(
                name: 'Bond',
                money: '20.354 ETH',
              ),
              SizedBox(width: 20),
              People(
                name: 'Bull will',
                money: '17.354 ETH',
              ),
              SizedBox(width: 20),
              People(
                name: 'Bull will',
                money: '17.354 ETH',
              ),
              SizedBox(width: 20),
              People(
                name: 'Bull will',
                money: '17.354 ETH',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Pransky extends StatelessWidget {
  const Pransky({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 140,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.logo,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pranksy',
                style: context.theme.textTheme.caption!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '35.958 ETH',
                style: context.theme.textTheme.caption!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class People extends StatelessWidget {
  const People({
    Key? key,
    required this.name,
    required this.money,
  }) : super(key: key);

  final String name;
  final String money;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 140,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.faceGirl,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: context.theme.textTheme.caption!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                money,
                style: context.theme.textTheme.caption!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
