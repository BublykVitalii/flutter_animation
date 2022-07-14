import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';
import 'package:flutter_animation/screens/med_online/screens/search_screen/widgets/card_med_center_doctors.dart';
import 'package:flutter_animation/screens/med_online/screens/search_screen/widgets/card_symptoms.dart';
import 'package:flutter_animation/screens/med_online/screens/search_screen/widgets/search_med.dart';
import 'package:flutter_animation/screens/med_online/screens/search_screen/widgets/symptoms.dart';

// ---Texts---
const _kTitle = 'Поиск';

// ---Parameters---
const _kPadding = 10.0;
const _kWidth = 10.0;
const _kHeight = 10.0;
const _kHeightDivider = 10.0;

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 0,
          leading: const SizedBox(),
          title: Text(
            _kTitle,
            style: context.theme.textTheme.headline4!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            Icon(Icons.account_circle),
            SizedBox(width: _kWidth),
          ],
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: _kPadding,
            left: _kPadding,
            right: _kPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SearchMed(),
              SizedBox(height: _kHeight),
              CardMedCenterDoctors(),
              Divider(height: _kHeightDivider),
              Symptoms(),
              SizedBox(height: _kHeight),
              CardSymptoms(),
            ],
          ),
        ),
      ),
    );
  }
}
