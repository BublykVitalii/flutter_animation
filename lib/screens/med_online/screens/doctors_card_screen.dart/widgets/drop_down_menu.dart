import 'package:flutter/material.dart';

// ---Texts---
const _kAboutTheDoctor = 'О докторе';
const _kServices = 'Услуги';
const _kReviews = 'Отзывы';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({Key? key}) : super(key: key);

  @override
  DropDownMenuState createState() => DropDownMenuState();
}

class DropDownMenuState extends State<DropDownMenu> {
  final _doctors = <Item>[
    Item(
      expandedValue:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
      headerValue: _kAboutTheDoctor,
    ),
    Item(
      expandedValue:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      headerValue: _kServices,
    ),
    Item(
      expandedValue:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      headerValue: _kReviews,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _doctors[index].isExpanded = !isExpanded;
        });
      },
      children: _doctors.map<ExpansionPanel>(
        (Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: ListTile(
              title: Text(item.expandedValue),
            ),
            isExpanded: item.isExpanded,
          );
        },
      ).toList(),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
