import 'package:flutter/material.dart';

// ---Texts---
const _kFindADoctor = 'Найти врача';

class SearchButtonDoctor extends StatelessWidget {
  const SearchButtonDoctor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextButton(
        onPressed: () {},
        child: const Text(_kFindADoctor),
      ),
    );
  }
}
