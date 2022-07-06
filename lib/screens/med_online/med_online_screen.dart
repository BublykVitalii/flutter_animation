import 'package:flutter/material.dart';

import 'package:flutter_animation/screens/med_online/screens/body_maine_screen.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_screen.dart';

import 'package:flutter_animation/screens/med_online/widgets/bottom_navigator_bar.dart';

class MedOnline extends StatefulWidget {
  static const _routeName = '/med-online-screen';

  static PageRoute<MedOnline> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const MedOnline();
      },
    );
  }

  const MedOnline({Key? key}) : super(key: key);

  @override
  State<MedOnline> createState() => _MedOnlineState();
}

class _MedOnlineState extends State<MedOnline> {
  int selectedIndex = 0;
  final Widget _medOnline = const BodyMaine();
  final Widget _doctors = const Doctors();
  final Widget _medCentre = const Text2();
  final Widget _medicine = const Text3();
  final Widget _records = const Text4();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigatorBar(
        currentIndex: selectedIndex,
        onTap: (int index) {
          onTapHandler(index);
        },
      ),
    );
  }

  Widget getBody() {
    if (selectedIndex == 0) {
      return _medOnline;
    } else if (selectedIndex == 1) {
      return _doctors;
    } else if (selectedIndex == 2) {
      return _medCentre;
    } else if (selectedIndex == 3) {
      return _medicine;
    } else {
      return _records;
    }
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class Text2 extends StatelessWidget {
  const Text2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class Text3 extends StatelessWidget {
  const Text3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class Text4 extends StatelessWidget {
  const Text4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
