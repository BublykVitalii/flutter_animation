import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';
import 'package:flutter_animation/screens/med_online/domain/doctor.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/widgets/drop_down_menu.dart';

// ---Texts---
const _kTitle = 'Врач';
const _kEnroll = 'Записаться';

// ---Parameters---
const _kPadding = 10.0;
const _kHeightWidth = 150.0;
const _kHeight = 5.0;

class DoctorCardScreen extends StatefulWidget {
  static const _routeName = '/med-centre-list-screen';

  static PageRoute route(Doctor doctor) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return DoctorCardScreen(doctor: doctor);
      },
    );
  }

  final Doctor doctor;

  const DoctorCardScreen({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  State<DoctorCardScreen> createState() => _DoctorCardScreenState();
}

class _DoctorCardScreenState extends State<DoctorCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          _kTitle,
          style: context.theme.textTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(_kPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _AvatarDoctor(),
              const SizedBox(height: _kPadding),
              _DoctorName(name: widget.doctor.name),
              const SizedBox(height: _kHeight),
              _DoctorSpeciality(speciality: widget.doctor.speciality),
              const SizedBox(height: _kPadding),
              const DropDownMenu(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: TextButton(
          onPressed: () {},
          child: const Text(_kEnroll),
        ),
      ),
    );
  }
}

class _AvatarDoctor extends StatelessWidget {
  const _AvatarDoctor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.doctor,
      width: _kHeightWidth,
      height: _kHeightWidth,
    );
  }
}

class _DoctorName extends StatelessWidget {
  const _DoctorName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: context.theme.textTheme.headline5!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _DoctorSpeciality extends StatelessWidget {
  const _DoctorSpeciality({
    Key? key,
    required this.speciality,
  }) : super(key: key);

  final String speciality;

  @override
  Widget build(BuildContext context) {
    return Text(
      speciality,
      style: context.theme.textTheme.subtitle1!,
    );
  }
}
