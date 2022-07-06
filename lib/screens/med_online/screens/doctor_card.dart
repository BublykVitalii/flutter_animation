import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kTitle = 'Врач';
const _kYourWaifu = 'Твоя Вайфу';
const _kObstetricianGynecologist = 'Aкушер - гинеколог';
const _kAboutTheDoctor = 'О докторе';
const _kServices = 'Услуги';
const _kReviews = 'Отзывы';
const _kEnroll = 'Записаться';

// ---Parameters---
const _kPadding = 10.0;
const _kHeightWidth = 150.0;
const _kHeight = 5.0;

class DoctorCard extends StatelessWidget {
  static const _routeName = '/doctor-card-screen';

  static PageRoute<DoctorCard> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const DoctorCard();
      },
    );
  }

  const DoctorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_kTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(_kPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.doctor,
                  width: _kHeightWidth,
                  height: _kHeightWidth,
                ),
                const SizedBox(height: _kPadding),
                Text(
                  _kYourWaifu,
                  style: context.theme.textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: _kHeight),
                Text(
                  _kObstetricianGynecologist,
                  style: context.theme.textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: _kPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_kAboutTheDoctor,
                        style: context.theme.textTheme.subtitle1!),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_kServices, style: context.theme.textTheme.subtitle1!),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_kReviews, style: context.theme.textTheme.subtitle1!),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
                const Divider(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(_kEnroll),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
