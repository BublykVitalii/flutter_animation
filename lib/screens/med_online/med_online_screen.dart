import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/doctors.dart';

import 'package:flutter_animation/screens/med_online/screens/search_screen/search.dart';

import 'package:flutter_animation/screens/med_online/screens/search_screen/widgets/bottom_navigator_bar.dart';

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
  final Widget _medOnline = const Search();
  final Widget _doctors = const Doctors();
  final Widget _medCentre = const Text2();
  final Widget _medicine = const Text2();
  final Widget _records = const Text2();

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (selectedIndex == 0) {
      body = _medOnline;
    } else if (selectedIndex == 1) {
      body = _doctors;
    } else if (selectedIndex == 2) {
      body = _medCentre;
    } else if (selectedIndex == 3) {
      body = _medicine;
    } else {
      body = _records;
    }

    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigatorBar(
        currentIndex: selectedIndex,
        onTap: (int index) {
          _onTapHandler(index);
        },
      ),
    );
  }

  void _onTapHandler(int index) {
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
