import 'package:flutter/material.dart';
import 'HomeWidget.dart';
import 'AuthWidget.dart';

class StartNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => AuthView(),
        '/home_page': (context) => MyApp(),
      },
    );
  }
}