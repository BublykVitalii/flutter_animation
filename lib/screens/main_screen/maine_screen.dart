import 'package:flutter/material.dart';

import 'package:flutter_animation/screens/main_screen/widgets/custom_app_bar.dart';
import 'package:flutter_animation/screens/main_screen/widgets/image_cards.dart';
import 'package:flutter_animation/screens/main_screen/widgets/search.dart';
import 'package:flutter_animation/screens/main_screen/widgets/sellers.dart';
import 'package:flutter_animation/screens/main_screen/widgets/text_topic.dart';

// ---Texts---
const _kHotBuds = 'Hot Bids 🔥';
const _kTopSellers = 'Top sellers';

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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 40),
            Search(),
            SizedBox(height: 40),
            TextTopic(title: _kHotBuds),
            ImageCards(),
            TextTopic(title: _kTopSellers),
            SizedBox(height: 20),
            Sellers(),
          ],
        ),
      ),
    );
  }
}
