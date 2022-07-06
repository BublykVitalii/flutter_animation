import 'package:flutter/material.dart';

// ---Texts---
const _kHint = 'Искать врача, клинику, симптомы';

class SearchMed extends StatelessWidget {
  const SearchMed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 2),
        hintText: _kHint,
        isCollapsed: true,
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.mic),
      ),
    );
  }
}
