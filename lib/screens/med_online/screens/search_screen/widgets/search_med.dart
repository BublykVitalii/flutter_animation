import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/domain/doctors_list.dart';
import 'package:flutter_animation/screens/med_online/screens/doctors_card_screen.dart/domain/med_centres_list.dart';
import 'package:searchfield/searchfield.dart';

// ---Texts---
const _kHint = 'Искать врача, клинику, симптомы';

// ---Parameters---
const _kPadding = 10.0;

class SearchMed extends StatefulWidget {
  const SearchMed({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchMed> createState() => _SearchMedState();
}

class _SearchMedState extends State<SearchMed> {
  TextEditingController editingController = TextEditingController();

  final doctors = DoctorList().doctors;
  final medCentre = MedCentresList().medCentres;

  late List<String> aboutDoctor = doctors
      .map(
        (doctor) => doctor.name.toLowerCase(),
      )
      .toList();
  late List<String> aboutMedcentre = medCentre
      .map(
        (e) => e.name.toLowerCase(),
      )
      .toList();
  late List<String> searchList = aboutDoctor;

  var items = <String>[];

  @override
  void initState() {
    searchList.addAll(aboutMedcentre);
    items.addAll(searchList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: _kPadding,
        left: _kPadding,
        right: _kPadding,
      ),
      child: Column(
        children: [
          SearchField(
            suggestionState: Suggestion.expand,
            suggestionAction: SuggestionAction.next,
            suggestions: searchList.map((e) => SearchFieldListItem(e)).toList(),
            textInputAction: TextInputAction.next,
            controller: editingController,
            hint: _kHint,
            maxSuggestionsInViewPort: 5,
            itemHeight: 45,
            onSuggestionTap: (x) {},
            searchInputDecoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 2),
              hintText: _kHint,
              isCollapsed: true,
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.mic),
            ),
          ),
        ],
      ),
    );
  }
}
