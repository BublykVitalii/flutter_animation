import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/dark_theme.dart';
import 'package:flutter_animation/infrastructure/theme/light_theme.dart';
import 'package:flutter_animation/screens/maine_screen/maine_screen.dart';
import 'package:provider/provider.dart';

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
  ThemeMode _themeMode = ThemeMode.system;

  void setThemeMode(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = MaterialApp(
      title: _kTitle.toUpperCase(),
      themeMode: _themeMode,
      theme: getLightTheme(context),
      darkTheme: getDarkTheme(context),
      onGenerateRoute: onGenerateRoute,
    );

    return MultiProvider(
      providers: [
        Provider.value(value: this),
        Provider.value(value: _themeMode),
      ],
      child: child,
    );
  }

  Route onGenerateRoute(RouteSettings? settings) {
    return MaineScreen.route;
  }
}
