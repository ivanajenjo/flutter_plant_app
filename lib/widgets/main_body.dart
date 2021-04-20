import 'package:flutter/material.dart';
import 'package:flutter_plant_app/models/plant.dart';
import 'package:flutter_plant_app/widgets/plant_card.dart';
import 'package:flutter_plant_app/utils/database_helper.dart';

class newBody extends StatefulWidget {
  newBody({Key key}) : super(key: key);

  @override
  _newBodyState createState() => _newBodyState();
}

class _newBodyState extends State<newBody> {
  DatabaseHelper helper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: helper.queryAllPlants(),
      initialData: [],
      builder: (context, snapshot) {
        return snapshot.hasData
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Plant plant = snapshot.data[index];
                  //get your item data here ...
                  return PlantCard('assets/images/plant.jpg', plant);
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No plants'),
                    CircularProgressIndicator(),
                  ],
                ),
              );
      },
    );
  }
}
