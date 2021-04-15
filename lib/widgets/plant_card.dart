import 'package:flutter/material.dart';
import 'package:flutter_plant_app/screens/plant_screen.dart';

class PlantCard extends StatelessWidget {
  final String imagePath;
  const PlantCard(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PlantScreen()));
      },
      child: Container(
        child: Card(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          margin: EdgeInsets.all(5),
        ),
      ),
    );
  }
}
