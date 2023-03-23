import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'SourceView/Controller.dart';
import 'StartNav.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(StartNav(Controller()));
}
