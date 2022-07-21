import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';
import 'package:flutter_animation/screens/med_online/domain/doctor.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/widgets/doctor_card_screen.dart';

// ---Texts---
const _kStar = '5.0';

// ---Parameters---
const _kWidth = 5.0;
const _kHeight = 5.0;
const _kWidthImage = 50.0;
const _kHeightImage = 50.0;
const _kSize = 15.0;

class DoctorsListScreen extends StatelessWidget {
  const DoctorsListScreen({
    Key? key,
    required this.doctors,
  }) : super(key: key);

  final List<Doctor> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              DoctorCardScreen.route(doctor),
            );
          },
          leading: const _DoctorAvatar(),
          title: Text(doctor.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: _kHeight),
              Text(
                doctor.speciality,
                style: context.theme.textTheme.caption!.copyWith(),
              ),
              const SizedBox(height: _kHeight),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: _kSize,
                    color: Colors.yellow.shade600,
                  ),
                  const SizedBox(width: _kWidth),
                  const Text(_kStar),
                  const SizedBox(width: _kWidth),
                  Text(doctor.experience),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DoctorAvatar extends StatelessWidget {
  const _DoctorAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.doctorsList,
      width: _kWidthImage,
      height: _kHeightImage,
    );
  }
}
