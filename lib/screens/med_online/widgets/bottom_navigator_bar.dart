import 'package:flutter/material.dart';

// ---Texts---
const _kSearch = 'поиск';
const _kDoctor = 'врачи';
const _kMedicalCenter = 'медцентры';
const _kMedicine = 'лекарства';
const _kRecords = 'записи';

class BottomNavigatorBar extends StatelessWidget {
  const BottomNavigatorBar({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);
  final int currentIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: _kSearch,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box_outlined),
          label: _kDoctor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border_outlined),
          label: _kMedicalCenter,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_information),
          label: _kMedicine,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note_add),
          label: _kRecords,
        ),
      ],
      onTap: onTap,
    );
  }
}
