import 'package:flutter/material.dart';

import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/domain/doctors_list.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/widgets/animated_toggle.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/widgets/doctor_app_bar.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/widgets/doctors_list.dart';
import 'package:flutter_animation/screens/med_online/screens/search_screen/widgets/search_med.dart';

// ---Texts---

// ---Parameters---
const _kHeight = 20.0;
const _kHeightPreferred = 56.0;

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  final doctors = DoctorList().doctors;

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
          child: DoctorAppBar(),
        ),
        body: Column(
          children: [
            const SearchMed(),
            const SizedBox(height: _kHeight),
            const AnimatedToggle(),
            const SizedBox(height: _kHeight),
            Expanded(
              child: DoctorsList(
                doctors: doctors,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
