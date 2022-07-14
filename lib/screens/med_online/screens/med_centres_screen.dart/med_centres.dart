import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/domain/med_centre.dart';

// ---Texts---
const _kTitle = 'Медцентры';

// ---Parameters---
class MedCentreForm extends FormField<List<MedCentre>> {
  MedCentreForm({
    Key? key,
    required FormFieldSetter<List<MedCentre>> onSaved,
    FormFieldValidator<List<MedCentre>>? validator,
    required List<MedCentre> medCentre,
    required List<MedCentre> selectedMedCentre,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (state) {
            return ListMedCentres(
                medCentreList: medCentre,
                selectedMedCentre: state.value ?? selectedMedCentre,
                onChanged: (medCentre) {
                  onSaved(medCentre);
                  state.didChange(medCentre);
                });
          },
        );
}

class ListMedCentres extends StatelessWidget {
  const ListMedCentres({
    Key? key,
    required this.medCentreList,
    required this.selectedMedCentre,
    required this.onChanged,
  }) : super(key: key);

  final List<MedCentre> medCentreList;
  final List<MedCentre> selectedMedCentre;
  final ValueChanged<List<MedCentre>> onChanged;

  void _onSelectSpeciality(MedCentre medCentre, bool isSelected) {
    final specialityList = List<MedCentre>.from(selectedMedCentre);
    if (isSelected) {
      specialityList.add(medCentre);
    } else {
      specialityList.remove(medCentre);
    }
    onChanged(specialityList);
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
        itemCount: medCentreList.length,
        itemBuilder: (context, index) {
          final medCentre = medCentreList[index];
          bool isSelected = selectedMedCentre.contains(medCentre);
          return CheckboxListTile(
            value: isSelected,
            onChanged: (value) {
              _onSelectSpeciality(medCentre, value!);
            },
            title: Text(medCentre.name),
          );
        },
      ),
    );
  }
}
