import 'package:flutter/material.dart';
import 'package:flutter_plant_app/models/plant.dart';
import 'package:flutter_plant_app/screens/detail_screen/detail_plant_screen_v2.dart';
import 'package:flutter_plant_app/utils/utility.dart';

class PlantCard extends StatefulWidget {
  final Plant plant;

  const PlantCard(this.plant);

  @override
  _PlantCardState createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPlantScreenV2(widget.plant)))
            .then((value) => setState(() {}));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: widget.plant.getColor(),
                //color: Colors.,
                blurRadius: 10.0,
                spreadRadius: 1,
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            child: Utility.imageFromBase64String(widget.plant.photoName),
          ),
        ),
      ),
    );
  }
}
