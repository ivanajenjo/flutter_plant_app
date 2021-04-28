import 'package:flutter/material.dart';
import 'package:flutter_plant_app/models/plant.dart';
import 'package:flutter_plant_app/screens/detail_plant_screen.dart';
import 'package:flutter_plant_app/utils/utility.dart';

import '../constants.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;
  const PlantCard(this.plant);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPlantScreen(plant)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColorDark,
                blurRadius: 10.0,
                spreadRadius: 0.5,
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            child: Utility.imageFromBase64String(plant.photoName),
          ),
        ),
      ),
    );
  }
}
