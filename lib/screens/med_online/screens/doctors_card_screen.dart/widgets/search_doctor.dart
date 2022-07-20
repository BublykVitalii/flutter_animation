import 'package:flutter/material.dart';

import 'package:searchfield/searchfield.dart';

import 'package:flutter_animation/screens/med_online/domain/doctors_list.dart';

// ---Texts---
const _kHint = 'Искать врача, клинику, симптомы';

// ---Parameters---
const _kPadding = 10.0;
const _kMaxSuggestionsInViewPort = 5;
const _kItemHeight = 45.0;

class SearchDoctor extends StatefulWidget {
  final ValueChanged<String> onSubmit;
  const SearchDoctor({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  TextEditingController editingController = TextEditingController();

  final doctors = DoctorList().doctors;

  late List<String> aboutDoctor = doctors
      .map(
        (doctor) => doctor.name.toLowerCase(),
      )
      .toList();

  late List<String> searchList = aboutDoctor;

  var items = <String>[];

  @override
  void initState() {
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
