import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/domain/doctor.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/domain/doctors_list.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/domain/med_centre.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/domain/med_centres_list.dart';
import 'package:flutter_animation/screens/med_online/screens/med_centres_screen.dart/med_centres.dart';
import 'package:flutter_animation/screens/med_online/screens/speciality_screen.dart/speciality.dart';
import 'package:intl/intl.dart';

import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kFilter = 'Фильтр';
const _kReset = 'Сбросить';
const _kSpecialist = 'Специализаци';
const _kAny = 'Любая';
const _kChildrenSpecialist = 'Детский специалист';
const _kMedicalCenter = 'Медцентры';
const _kAnyy = 'Любой';
const _kDate = 'Дата приема';
const _kFindADoctor = 'Найти врача';

// ---Parameters---
const _kPadding = 10.0;
const _kWidth = 10.0;
const _kHeightPreferred = 56.0;

class Filter extends StatefulWidget {
  static const _routeName = '/filter-screen';

  static PageRoute<Filter> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const Filter();
      },
    );
  }

  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final _formKey = GlobalKey<FormState>();
  bool isSwitched = false;

  final doctors = DoctorList().doctors;
  final medCentre = MedCentresList().medCentres;
  List<Doctor> selectedDoctor = [];
  List<MedCentre> selectedMedCentre = [];

  DateTime data = DateTime.now();
  DateTime dataNow = DateTime.now();
  final outputFormat = DateFormat('dd MMM yyyy');

  @override
  Widget build(BuildContext context) {
    var outputDate = outputFormat.format(data);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(_kHeightPreferred),
        child: _FilterAppBar(
          onPressed: () {
            selectedDoctor.clear();
            selectedMedCentre.clear();
            setState(() {
              isSwitched = false;
              data = dataNow;
            });
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(_kPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  _DropdownButton(
                    title: _kSpecialist,
                    titleButton: _kAny,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => SpecialityForm(
                            doctors: doctors,
                            selectedDoctor: selectedDoctor,
                            onSaved: (value) {
                              if (value != null) {
                                setState(() {
                                  selectedDoctor = value;
                                });
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  _SwitchWidget(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                  const Divider(),
                  _DropdownButton(
                    title: _kMedicalCenter,
                    titleButton: _kAnyy,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => MedCentreForm(
                            medCentre: medCentre,
                            selectedMedCentre: selectedMedCentre,
                            onSaved: (value) {
                              if (value != null) {
                                setState(() {
                                  selectedMedCentre = value;
                                });
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  _DateWidget(
                    onPressed: _selectDate,
                    date: outputDate,
                  ),
                  const Divider(),
                ],
              ),
              const SearchButtonDoctor(),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: data,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime(2030, 12),
    );
    if (newDate != null) {
      setState(() {
        data = newDate;
      });
    }
  }
}

class _FilterAppBar extends StatelessWidget {
  const _FilterAppBar({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        _kFilter,
        style: context.theme.textTheme.headline6!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: [
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Text(
              _kReset,
              style: context.theme.textTheme.button!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.accentColorMedical,
              ),
            ),
          ),
        ),
        const SizedBox(width: _kWidth),
      ],
    );
  }
}

class _DropdownButton extends StatelessWidget {
  const _DropdownButton({
    Key? key,
    required this.title,
    required this.titleButton,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String titleButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: context.theme.textTheme.subtitle1!),
          Row(
            children: [
              Text(
                titleButton,
                style: context.theme.textTheme.subtitle1!,
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SwitchWidget extends StatelessWidget {
  const _SwitchWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _kChildrenSpecialist,
            style: context.theme.textTheme.subtitle1!,
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _DateWidget extends StatelessWidget {
  const _DateWidget({
    Key? key,
    required this.onPressed,
    required this.date,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(_kDate, style: context.theme.textTheme.subtitle1!),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: onPressed,
          child: Text(
            date,
            style: context.theme.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.accentColorMedical,
            ),
          ),
        ),
      ],
    );
  }
}

class SearchButtonDoctor extends StatelessWidget {
  const SearchButtonDoctor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.maxFinite,
        child: TextButton(
          onPressed: () {},
          child: const Text(_kFindADoctor),
        ),
      ),
    );
  }
}
