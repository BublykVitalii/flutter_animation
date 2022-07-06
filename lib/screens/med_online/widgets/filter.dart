import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_colors.dart';

import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';
import 'package:intl/intl.dart';

// ---Texts---
const _kFilter = 'Фильтр';
const _kReset = 'Сбросить';
const _kSpecialist = 'Специализаци';
const _kAny = 'Любая';
const _kChildrenSpecialist = 'Детский специалист';
const _kMedicalCenter = 'Медцентры';
const _kAnyy = 'Любой';
const _kDate = 'Дата приема';
const _kFindADoctor = 'Найти врача';

// ---Parameters---
const _kPadding = 10.0;
const _kWidth = 5.0;

class Filter extends StatelessWidget {
  static const _routeName = '/filter-screen';

  static PageRoute<Filter> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const Filter();
      },
    );
  }

  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = DateTime.now();
    var outputFormat = DateFormat('dd MMM yyyy');
    var outputDate = outputFormat.format(data);

    return Scaffold(
      appBar: AppBar(
        title: const Text(_kFilter),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Text(
              _kReset,
              style: context.theme.textTheme.button!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.accentColorMedical,
              ),
            ),
          ),
          const SizedBox(width: _kWidth),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(_kPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_kSpecialist,
                        style: context.theme.textTheme.subtitle1!),
                    Row(
                      children: [
                        Text(_kAny, style: context.theme.textTheme.subtitle1!),
                        const SizedBox(width: _kWidth),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_kChildrenSpecialist,
                        style: context.theme.textTheme.subtitle1!),
                    Switch(
                      value: false,
                      onChanged: (_) {},
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_kMedicalCenter,
                        style: context.theme.textTheme.subtitle1!),
                    Row(
                      children: [
                        Text(_kAnyy, style: context.theme.textTheme.subtitle1!),
                        const SizedBox(width: _kWidth),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_kDate, style: context.theme.textTheme.subtitle1!),
                    Text(
                      outputDate,
                      style: context.theme.textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentColorMedical,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(_kFindADoctor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
