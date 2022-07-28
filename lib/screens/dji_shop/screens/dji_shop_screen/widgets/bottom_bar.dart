import 'package:flutter/material.dart';

// ---Parameters---
const _kRadius = Radius.circular(25);

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: _kRadius,
        topRight: _kRadius,
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.bookmark_outline),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.favorite_outline),
              onPressed: () {},
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.shop),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
