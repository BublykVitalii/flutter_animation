import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/med_online/domain/doctors_list.dart';
import 'package:flutter_animation/screens/med_online/domain/med_centres_list.dart';
import 'package:searchfield/searchfield.dart';

// ---Texts---
const _kHint = 'Искать врача, клинику, симптомы';

// ---Parameters---
const _kPadding = 10.0;
const _kMaxSuggestionsInViewPort = 5;
const _kItemHeight = 45.0;

class SearchMed extends StatefulWidget {
  final ValueChanged<String> onSubmit;
  const SearchMed({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<SearchMed> createState() => _SearchMedState();
}

class _SearchMedState extends State<SearchMed> {
  TextEditingController editingController = TextEditingController();

  List<String> searchList =
      DoctorList().doctors.map((doctor) => doctor.name.toLowerCase()).toList();

  List<String> aboutDoctorSpeciality = DoctorList()
      .doctors
      .map((doctor) => doctor.speciality.toLowerCase())
      .toList();

  List<String> aboutMedcentre =
      MedCentresList().medCentres.map((e) => e.name.toLowerCase()).toList();

  final items = <String>[];

  @override
  void initState() {
    searchList
      ..addAll(aboutMedcentre)
      ..addAll(aboutDoctorSpeciality);
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
            onSuggestionTap: (value) {
              widget.onSubmit(value.searchKey);
            },
            suggestionState: Suggestion.expand,
            suggestionAction: SuggestionAction.next,
            suggestions: searchList.map((e) => SearchFieldListItem(e)).toList(),
            textInputAction: TextInputAction.next,
            controller: editingController,
            maxSuggestionsInViewPort: _kMaxSuggestionsInViewPort,
            itemHeight: _kItemHeight,
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
