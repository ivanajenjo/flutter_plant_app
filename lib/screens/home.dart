import 'package:flutter/material.dart';
import 'package:flutter_plant_app/constants.dart';
import 'package:flutter_plant_app/screens/add_plant_screen.dart';
import 'package:flutter_plant_app/widgets/appbar.dart';
import 'package:flutter_plant_app/widgets/plant_card.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Icon(Icons.add),
        //backgroundColor: kPrimaryColorDark,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPlantScreen(),
            ),
          );
        },
      ),
    );
  }
}
