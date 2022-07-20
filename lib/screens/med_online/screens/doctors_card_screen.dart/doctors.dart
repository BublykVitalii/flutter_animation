import 'package:flutter/material.dart';

import 'package:flutter_animation/screens/med_online/domain/doctor.dart';
import 'package:flutter_animation/screens/med_online/domain/doctors_list.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/widgets/tabs.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/widgets/doctor_app_bar.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/widgets/doctors_list.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/widgets/search_doctor.dart';

// ---Parameters---
const _kHeight = 10.0;
const _kHeightPreferred = 56.0;
const _kPadding = 10.0;

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  final doctors = DoctorList().doctors;
  List<Doctor> searchValue = [];
  String name = '';
  Doctor doctorSearch = Doctor(
    name: 'test',
    experience: 'test',
    id: 20,
    speciality: 'test',
  );

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
            SearchDoctor(
              onSubmit: (value) {
                setState(() {
                  name = value;
                  if (value.isNotEmpty) {
                    final newDoctor = doctors.firstWhere(
                      (element) => name == element.name.toLowerCase(),
                    );
                    searchValue.add(newDoctor);
                    doctorSearch = newDoctor;
                  }
                });
              },
            ),
            const SizedBox(height: _kHeight),
            Padding(
              padding: const EdgeInsets.only(
                left: _kPadding,
                right: _kPadding,
              ),
              child: Tabs(tabController: _tabController),
            ),
            const SizedBox(height: _kHeight),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  DoctorsList(
                    doctors: searchValue.isEmpty
                        ? doctors
                        : listChange(doctors, doctorSearch),
                  ),
                  Container(color: Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Doctor> listChange(List<Doctor> doctors, Doctor search) {
    return doctors.where((value) {
      return value.name.startsWith(search.name);
    }).toList();
  }
}
