import 'package:flutter/material.dart';
import 'package:flutter_plant_app/models/plant.dart';
import 'package:flutter_plant_app/widgets/plant_card.dart';
import 'package:flutter_plant_app/utils/database_helper.dart';

class MainBody extends StatefulWidget {
  MainBody({Key key}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  DatabaseHelper helper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: helper
          .queryAllPlantsSorted(), //Cambiar a queryAllPlants para obtener las plantas por orden de la base de datos.
      initialData: [],
      builder: (context, snapshot) {
        return snapshot.hasData
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Plant plant = snapshot.data[index];
                  //get your item data here ...
                  return PlantCard(plant);
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
