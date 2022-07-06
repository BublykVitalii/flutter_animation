import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

import 'package:flutter_animation/screens/med_online/domaine/doctor.dart';
import 'package:flutter_animation/screens/med_online/widgets/animated_toggle.dart';
import 'package:flutter_animation/screens/med_online/widgets/doctors_list.dart';
import 'package:flutter_animation/screens/med_online/widgets/filter.dart';
import 'package:flutter_animation/screens/med_online/widgets/search.dart';

// ---Texts---
const _kFilter = 'Фильтр';
const _kTitle = 'Врачи';
const _kList = 'Список';
const _kMap = 'Карта';

// ---Parameters---
const _kPadding = 10.0;
const _kWidth = 14.0;
const _kHeight = 20.0;

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  final doctors = List<Doctor>.generate(21, (i) {
    return Doctor(
      name: 'Ruru $i',
      speciality: 'neurologist',
      experience: 'Стаж 25 лет',
      id: i,
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        leadingWidth: 0,
        title: const Text(_kTitle),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, Filter.route);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.black,
              ),
              side: MaterialStateProperty.all(
                const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            child: Text(
              _kFilter,
              style: context.theme.textTheme.button!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.accentColorMedical,
              ),
            ),
          ),
          const SizedBox(width: _kWidth),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(_kPadding),
        child: Column(
          children: [
            const SearchMed(),
            const SizedBox(height: _kHeight),
            AnimatedToggle(
              values: const [_kList, _kMap],
              onToggleCallback: (value) {
                setState(() {});
              },
            ),
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
