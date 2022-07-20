import 'package:flutter/material.dart';

// ---Texts---
const _kList = 'Список';
const _kMap = 'Карта';

// ---Parameters---
const _kPadding = 2.0;
const _kRadius = 10.0;
const _kPaddingContainerTabs = 5.0;

class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_kPadding),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.all(
          Radius.circular(_kRadius),
        ),
      ),
      child: TabBar(
        indicator: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(_kRadius),
          ),
        ),
        labelPadding: const EdgeInsets.all(_kPadding),
        controller: _tabController,
        tabs: [
          const SizedBox(
            width: double.maxFinite,
            child: Align(
              alignment: Alignment.center,
              child: Text(_kList),
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(_kPaddingContainerTabs),
            child: const Align(
              alignment: Alignment.center,
              child: Text(_kMap),
            ),
          ),
        ],
      ),
    );
  }
}
