import 'package:flutter/material.dart';

class DjiShopScreen extends StatefulWidget {
  static const _routeName = '/dji-shop-screen';

  static PageRoute<DjiShopScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const DjiShopScreen();
      },
    );
  }

  const DjiShopScreen({Key? key}) : super(key: key);

  @override
  State<DjiShopScreen> createState() => _DjiShopScreenState();
}

class _DjiShopScreenState extends State<DjiShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
