import 'package:flutter/material.dart';

// ---Texts---
const _kHint = 'Search';

// ---Parameters---
const _kWidth = 250.0;
const _kWidthBox = 10.0;

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 10,
      ),
      child: SizedBox(
        width: _kWidth,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: _kHint,
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.search),
                Icon(Icons.mic),
                SizedBox(width: _kWidthBox),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
