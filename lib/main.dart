import 'package:flutter/material.dart';
import 'constants.dart';
import 'widgets/plant_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riega las Plantas',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('RiegApp'),
          ),
          body: GridView.count(
            crossAxisCount: 2,
            children: [
              PlantCard(),
              PlantCard(),
              PlantCard(),
              PlantCard(),
            ],
          )),
    );
  }
}
