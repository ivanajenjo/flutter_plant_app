import 'package:flutter/material.dart';
import 'package:flutter_plant_app/screens/home.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riega las Plantas',
      theme: buildThemeData(context),
      home: Home(),
    );
  }
}
