import 'package:flutter/material.dart';
import 'constants.dart';
import 'widgets/plant_card.dart';
import 'widgets/appbar.dart';

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
        appBar: buildAppBar(),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            PlantCard('assets/images/plant.jpg'),
            PlantCard('assets/images/plant.jpg'),
            PlantCard('assets/images/plant.jpg'),
            PlantCard('assets/images/plant.jpg'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          backgroundColor: kPrimaryColorDark,
        ),
      ),
    );
  }
}
