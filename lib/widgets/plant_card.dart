import 'package:flutter/material.dart';
import 'package:flutter_plant_app/models/plant.dart';
import 'package:flutter_plant_app/screens/detail_plant_screen.dart';
import 'package:flutter_plant_app/utils/utility.dart';

class PlantCard extends StatelessWidget {
  final String imagePath;
  final Plant plant;
  const PlantCard(this.imagePath, this.plant);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPlantScreen()));
      },
      child: Container(
        child: Utility.imageFromBase64String(plant.photoName),
      ),
    );
  }
}
