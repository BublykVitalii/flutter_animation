import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/rypto_screen/widgets/connect_wallet.dart';

import 'package:flutter_animation/screens/rypto_screen/widgets/custom_app_bar.dart';
import 'package:flutter_animation/screens/rypto_screen/widgets/image_cards.dart';
import 'package:flutter_animation/screens/rypto_screen/widgets/search.dart';
import 'package:flutter_animation/screens/rypto_screen/widgets/sellers.dart';
import 'package:flutter_animation/screens/rypto_screen/widgets/text_topic.dart';

// ---Texts---
const _kHotBuds = 'Hot Bids 🔥';
const _kTopSellers = 'Top sellers';

// ---Parameters---
const _kHeight = 40.0;
const _kHeightRadius = 20.0;
const _kHeightPreferred = 60.0;

class RyptoScreen extends StatefulWidget {
  static const _routeName = '/rypto-screen';

  static PageRoute<RyptoScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const RyptoScreen();
      },
    );
  }

  const RyptoScreen({Key? key}) : super(key: key);

  @override
  State<RyptoScreen> createState() => _RyptoScreenState();
}

class _RyptoScreenState extends State<RyptoScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(_kHeightPreferred),
          child: CustomAppBar(),
        ),
        body: Stack(
          children: [
            const ConnectWallet(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: _kHeight),
                  Search(),
                  SizedBox(height: _kHeight),
                  TextTopic(title: _kHotBuds),
                  ImageCards(),
                  TextTopic(title: _kTopSellers),
                  SizedBox(height: _kHeightRadius),
                  Sellers(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
