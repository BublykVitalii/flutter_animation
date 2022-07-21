import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:flutter_animation/screens/med_online/domain/doctor.dart';
import 'package:flutter_animation/screens/med_online/domain/doctors_list.dart';
import 'package:flutter_animation/screens/med_online/domain/med_centre.dart';
import 'package:flutter_animation/screens/med_online/domain/med_centres_list.dart';

import 'package:flutter_animation/screens/med_online/screens/filter_screen/widgets/filter_app_bar.dart';
import 'package:flutter_animation/screens/med_online/screens/filter_screen/widgets/med_centres.dart';
import 'package:flutter_animation/screens/med_online/screens/filter_screen/widgets/speciality.dart';
import 'package:flutter_animation/screens/med_online/screens/filter_screen/widgets/date_widget.dart';
import 'package:flutter_animation/screens/med_online/screens/filter_screen/widgets/drop_down_button.dart';
import 'package:flutter_animation/screens/med_online/screens/filter_screen/widgets/search_button_doctor.dart';
import 'package:flutter_animation/screens/med_online/screens/filter_screen/widgets/switch_widget.dart';

// ---Texts---
const _kSpecialist = 'Специализаци';
const _kAny = 'Любая';
const _kMedicalCenter = 'Медцентры';
const _kAnyy = 'Любой';

// ---Parameters---
const _kPadding = 10.0;
const _kHeightPreferred = 56.0;

class FilterScreen extends StatefulWidget {
  static const _routeName = '/filter-screen';

  static PageRoute<FilterScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const FilterScreen();
      },
    );
  }

  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isSwitched = false;

  final doctors = DoctorList().doctors;
  final medCentre = MedCentresList().medCentres;
  List<Doctor> selectedDoctor = [];
  List<MedCentre> selectedMedCentre = [];

  DateTime data = DateTime.now();
  DateTime dataNow = DateTime.now();
  final outputFormat = DateFormat('dd MMM yyyy');
  String _newMedCentreName = '';
  String _newDoctorSpeciality = '';

  @override
  Widget build(BuildContext context) {
    var outputDate = outputFormat.format(data);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(_kHeightPreferred),
          child: FilterAppBar(
            onPressed: () {
              selectedDoctor.clear();
              selectedMedCentre.clear();
              setState(() {
                isSwitched = false;
                data = dataNow;
                _newDoctorSpeciality = _kAnyy;
                _newMedCentreName = _kAnyy;
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
                    DropdownButtonFilter(
                      title: _kSpecialist,
                      titleButton: _newDoctorSpeciality.isEmpty
                          ? _kAny
                          : _newDoctorSpeciality,
                      onPressed: () async {
                        final result = await Navigator.push(
                            context, SpecialityDoctor.route);
                        setState(() {
                          _newDoctorSpeciality = result ?? '';
                        });
                      },
                    ),
                    const Divider(),
                    SwitchWidget(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                    const Divider(),
                    DropdownButtonFilter(
                      title: _kMedicalCenter,
                      titleButton: _newMedCentreName.isEmpty
                          ? _kAnyy
                          : _newMedCentreName,
                      onPressed: () async {
                        final resultTwo =
                            await Navigator.push(context, MedcentreList.route);
                        setState(() {
                          _newMedCentreName = resultTwo ?? '';
                        });
                      },
                    ),
                    const Divider(),
                    DateWidget(
                      onPressed: _selectDate,
                      date: outputDate,
                    ),
                    const Divider(),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomSheet: const SearchButtonDoctor(),
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
