import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/dji_shop/screens/dji_shop_screen/dji_shop_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_animation/application.dart';
import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/screens/form_field/form_field_screen.dart';
import 'package:flutter_animation/screens/maine_screen/widgets/body_cards.dart';
import 'package:flutter_animation/screens/med_online/med_online_screen.dart';
import 'package:flutter_animation/screens/rypto_screen/rypto_screen.dart';

// ---Texts---
const _kTitle = 'my experience';
const _kRyptoScreen = 'Rypto screen';
const _kForm = 'Form field';
const _kMed = 'Med Online';
const _kLightTheme = 'Light theme';
const _kDarkTheme = 'Dark theme';
const _kDjiShop = 'dji shop';

// ---Parameters---
const _kHeightRadius = 20.0;

class MaineScreen extends StatefulWidget {
  static const _routeName = '/maine-screen';

  static PageRoute<MaineScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const MaineScreen();
      },
    );
  }

  const MaineScreen({Key? key}) : super(key: key);

  @override
  State<MaineScreen> createState() => _MaineScreenState();
}

class _MaineScreenState extends State<MaineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _kTitle.toUpperCase(),
        ),
        actions: [
          PopupMenuButton<ThemeMode>(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: ThemeMode.light,
                child: Text(_kLightTheme),
              ),
              const PopupMenuItem(
                value: ThemeMode.dark,
                child: Text(_kDarkTheme),
              ),
            ],
            onSelected: (themeMode) {
              context.read<MyAppState>().setThemeMode(themeMode);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(_kHeightRadius),
            child: Column(
              children: [
                BodyCards(
                  title: _kDjiShop.toUpperCase(),
                  onTap: () {
                    Navigator.push(context, DjiShopScreen.route);
                  },
                  image: AppImages.djiShop,
                ),
                const SizedBox(height: 20),
                BodyCards(
                  title: _kMed.toUpperCase(),
                  onTap: () {
                    Navigator.push(context, MedOnline.route);
                  },
                  image: AppImages.med,
                ),
                const SizedBox(height: 20),
                BodyCards(
                  title: _kForm.toUpperCase(),
                  onTap: () {
                    Navigator.push(context, FormFieldScreen.route);
                  },
                  image: AppImages.artTwo,
                ),
                const SizedBox(height: 20),
                BodyCards(
                  title: _kRyptoScreen.toUpperCase(),
                  onTap: () {
                    Navigator.push(context, RyptoScreen.route);
                  },
                  image: AppImages.artOne,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
