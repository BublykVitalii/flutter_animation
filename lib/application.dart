import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/main_screen/maine_screen.dart';

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
    const MaterialApp();

    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
    );
  }

  Route onGenerateRoute(RouteSettings? settings) {
    return MaineScreen.route;
  }
}
