import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/domain/doctor.dart';

// ---Texts---
const _kTitle = 'Специализации';

class SpecialityForm extends FormField<List<Doctor>> {
  SpecialityForm({
    Key? key,
    required FormFieldSetter<List<Doctor>> onSaved,
    FormFieldValidator<List<Doctor>>? validator,
    required List<Doctor> doctors,
    required List<Doctor> selectedDoctor,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (state) {
            return DoctorSpecialityList(
                doctorList: doctors,
                selectedDoctor: state.value ?? selectedDoctor,
                onChanged: (doctors) {
                  onSaved(doctors);
                  state.didChange(doctors);
                });
          },
        );
}

class DoctorSpecialityList extends StatelessWidget {
  const DoctorSpecialityList({
    Key? key,
    required this.doctorList,
    required this.selectedDoctor,
    required this.onChanged,
  }) : super(key: key);

  final List<Doctor> doctorList;
  final List<Doctor> selectedDoctor;
  final ValueChanged<List<Doctor>> onChanged;

  void _onSelectSpeciality(Doctor doctor, bool isSelected) {
    final doctorList = List<Doctor>.from(selectedDoctor);
    if (isSelected) {
      doctorList.add(doctor);
    } else {
      doctorList.remove(doctor);
    }
    onChanged(doctorList);
  }

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
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: doctorList.length,
        itemBuilder: (context, index) {
          final doctor = doctorList[index];
          bool isSelected = selectedDoctor.contains(doctor);
          return CheckboxListTile(
            value: isSelected,
            onChanged: (value) {
              _onSelectSpeciality(doctor, value!);
            },
            title: Text(doctor.speciality),
          );
        },
      ),
    );
  }
}
