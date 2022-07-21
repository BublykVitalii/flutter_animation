import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/dark_theme.dart';
import 'package:flutter_animation/screens/maine_screen/maine_screen.dart';

// ---Texts---
const _kTitle = 'my experience';

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Widget child = MaterialApp(
      title: _kTitle.toUpperCase(),
      themeMode: ThemeMode.dark,
      darkTheme: getDarkTheme(context),
      onGenerateRoute: onGenerateRoute,
    );
    return child;
  }

  Route onGenerateRoute(RouteSettings? settings) {
    return MaineScreen.route;
  }
}
