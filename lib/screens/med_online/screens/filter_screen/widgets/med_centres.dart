import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';
import 'package:flutter_animation/screens/med_online/domain/med_centre.dart';
import 'package:flutter_animation/screens/med_online/domain/med_centres_list.dart';

// ---Texts---
const _kTitle = 'Медцентры';
const _kSaveMedcentre = 'Сохранить';

class MedcentreList<String> extends StatefulWidget {
  static const _routeName = '/med-centre-list-screen';

  static PageRoute get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const MedcentreList();
      },
    );
  }

  const MedcentreList({Key? key}) : super(key: key);

  @override
  State<MedcentreList> createState() => _MedcentreListState();
}

class _MedcentreListState extends State<MedcentreList> {
  final medCentreList = MedCentresList().medCentres;
  MedCentre selectedMedCentre = MedCentresList().medCentres.first;
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
          itemCount: medCentreList.length,
          itemBuilder: (context, index) {
            final medCentre = medCentreList[index];

            return RadioListTile<MedCentre>(
              value: medCentre,
              groupValue: selectedMedCentre,
              onChanged: (MedCentre? value) {
                setState(() {
                  selectedMedCentre = value ?? medCentre;
                });
              },
              title: Text(medCentre.name),
            );
          },
        ),
      ),
      bottomSheet: _SaveMedCentre(onSaved: () {
        _onPressedSave;
        _handleReturn(context);
      }),
    );
  }

  _onPressedSave() async {
    _formKey.currentState!.save();
  }

  void _handleReturn(BuildContext context) {
    Navigator.pop(context, selectedMedCentre.name);
  }
}

class _SaveMedCentre extends StatelessWidget {
  const _SaveMedCentre({
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
        child: const Text(_kSaveMedcentre),
      ),
    );
  }
}
