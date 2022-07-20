import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';
import 'package:flutter_animation/screens/med_online/domain/doctor.dart';
import 'package:flutter_animation/screens/med_online/domain/doctors_list.dart';

// ---Texts---
const _kTitle = 'Специализации';
const _kSaveSpeciality = 'Сохранить';

class SpecialityDoctor extends StatefulWidget {
  static const _routeName = '/speciality-doctor-screen';

  static PageRoute<String> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const SpecialityDoctor();
      },
    );
  }

  const SpecialityDoctor({Key? key}) : super(key: key);

  @override
  State<SpecialityDoctor> createState() => _SpecialityDoctorState();
}

class _SpecialityDoctorState extends State<SpecialityDoctor> {
  final doctors = DoctorList().doctors;
  Doctor selectedDoctor = DoctorList().doctors.first;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _kTitle,
          style: context.theme.textTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return RadioListTile<Doctor>(
              value: doctor,
              groupValue: selectedDoctor,
              onChanged: (Doctor? value) {
                setState(() {
                  selectedDoctor = value ?? doctor;
                });
              },
              title: Text(doctor.speciality),
            );
          },
        ),
      ),
      bottomSheet: SaveSpeciality(onSaved: () {
        _onPressedSave;
        _handleReturn(context);
      }),
    );
  }

  _onPressedSave() async {
    _formKey.currentState!.save();
  }

  void _handleReturn(BuildContext context) {
    Navigator.pop(context, selectedDoctor.speciality);
  }
}

class SaveSpeciality extends StatelessWidget {
  const SaveSpeciality({
    Key? key,
    required this.onSaved,
  }) : super(key: key);

  final VoidCallback onSaved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextButton(
        onPressed: onSaved,
        child: const Text(_kSaveSpeciality),
      ),
    );
  }
}
